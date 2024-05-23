//
//  TopRatedViewModel.swift
//  themoviewDbMVVMSwiftUikits
//
//  Created by Sergio Luis Noriega Pita on 23/05/24.
//

import Foundation
import Combine

class TopRatedViewModel: ObservableObject {
    @Published var topRatedMovies: [Movie] = []
    private var cancellables = Set<AnyCancellable>()

    func fetchTopRatedMovies() {
        APIManager.shared.fetchMovies(endpoint: "top_rated") { [weak self] result in
            switch result {
            case .success(let movies):
                DispatchQueue.main.async {
                    self?.topRatedMovies = movies
                }
            case .failure(let error):
                print("Error fetching top-rated movies: \(error)")
            }
        }
    }
}

