//
//  PopularViewModel.swift
//  themoviewDbMVVMSwiftUikits
//
//  Created by Sergio Luis Noriega Pita on 23/05/24.
//

import Foundation
import Combine

class PopularViewModel: ObservableObject {
    @Published var popularMovies: [Movie] = []
    private var cancellables = Set<AnyCancellable>()
    
    func fetchPopularMovies() {
        APIManager.shared.fetchPopularMovies { [weak self] result in
            switch result {
            case .success(let movies):
//                DispatchQueue.main.async {
                    self?.popularMovies = movies
//                }
            case .failure(let error):
                print("Error fetching popular movies: \(error)")
            }
        }
    }
}
