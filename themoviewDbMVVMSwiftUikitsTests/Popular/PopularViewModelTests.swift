//
//  PopularViewModelTests.swift
//  themoviewDbMVVMSwiftUikitsTests
//
//  Created by Sergio Luis Noriega Pita on 23/05/24.
//

import XCTest
@testable import themoviewDbMVVMSwiftUikits

final class PopularViewModelTests: XCTestCase {

    var popularViewModel: PopularViewModel!

    override func setUp() {
        super.setUp()
        popularViewModel = PopularViewModel()
    }

    func testFetchPopularMoviesSuccess() {
     
        let expectedMovies = [Movie]()
        let apiManager = APIManager()
        apiManager.fetchPopularMovies { [weak self] result in
            switch result {
            case .success(let movies):
                self?.popularViewModel?.popularMovies = movies
            case .failure(let error):
                XCTFail("Error fetching popular movies: \(error)")
            }
        }

        
        
        popularViewModel.fetchPopularMovies()
        XCTAssertNotNil(popularViewModel.popularMovies)
        XCTAssertEqual(popularViewModel.popularMovies, expectedMovies)
    }

    func testFetchPopularMoviesError() {
        let error = NSError(domain: "com.example.PopularViewModel",
                            code: -1,
                           userInfo: [NSLocalizedDescriptionKey: "Error fetching popular movies"])
        popularViewModel.fetchPopularMovies()
        XCTAssertNotNil(popularViewModel.popularMovies)
        XCTFail("Error fetching popular movies")
    }
}
