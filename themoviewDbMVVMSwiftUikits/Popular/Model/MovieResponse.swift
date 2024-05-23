//
//  MovieResponse.swift
//  themoviewDbMVVMSwiftUikits
//
//  Created by Sergio Luis Noriega Pita on 23/05/24.
//

import Foundation

struct MovieResponse: Decodable {
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Movie: Codable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    let backdropPath: String?
    let voteAverage: Double   // Cambiado de vote_average a voteAverage
    let releaseDate: String
    let adult: Bool
    let originalLanguage: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case voteAverage = "vote_average"   // Ajustado para coincidir con la clave de los datos de la API
        case releaseDate = "release_date"
        case adult
        case originalLanguage = "original_language"
    }
}

