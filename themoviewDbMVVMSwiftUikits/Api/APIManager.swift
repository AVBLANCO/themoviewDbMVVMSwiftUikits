//
//  APIManager.swift
//  periferiaTheMoviesDBSwift
//
//  Created by Sergio Luis Noriega Pita on 20/05/24.
//

import Foundation

class APIManager {
    static let shared = APIManager()
    private let apiKey = "c8553d76f6ad36989c60e55035b740f0"
    private let baseURL = "https://api.themoviedb.org/3/movie/"
    private let imageBaseURL = "https://image.tmdb.org/t/p/w200"

    private init() {}

    func fetchMovies(endpoint: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard var urlComponents = URLComponents(string: "\(baseURL)\(endpoint)") else { return }
        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: "1")
        ]

        guard let url = urlComponents.url else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else { return }

            do {
                let response = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(response.results))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    func searchMovies(query: String, completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard var urlComponents = URLComponents(string: "\(baseURL)search/movie") else { return }
        urlComponents.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "query", value: query)
        ]

        guard let url = urlComponents.url else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else { return }

            do {
                let response = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(response.results))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    func fetchPopularMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        fetchMovies(endpoint: "popular", completion: completion)
    }

    func fetchTopRatedMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        fetchMovies(endpoint: "top_rated", completion: completion)
    }

    func getImageURL(path: String) -> URL? {
        return URL(string: "\(imageBaseURL)\(path)")
    }
}
