//
//  APIManagerTests.swift
//  themoviewDbMVVMSwiftUikitsTests
//
//  Created by Sergio Luis Noriega Pita on 23/05/24.
//

import XCTest

final class APIManagerTests: XCTestCase {

    var apiManager: APIManager!

    override func setUp() {
        super.setUp()
        apiManager = APIManager()
    }

    func testFetchMovies() {
        let endpoint = "popular"
        let expectedResponse = MovieResponse(results: [])
        
        var response: Result<[Movie], Error>?
        apiManager.fetchMovies(endpoint: endpoint) { result in
            response = result
        }

        XCTAssertNotNil(response)
    }

    func testSearchMovies() {

        let query = "The Shawshank Redemption"
        let expectedResponse = MovieResponse(results: [])
        var response: Result<[Movie], Error>?
        apiManager.searchMovies(query: query) { result in
            response = result
        }
        XCTAssertNotNil(response)
    }

    func testFetchPopularMovies() {
        let expectedResponse = MovieResponse(results: [])
        var response: Result<[Movie], Error>?
        apiManager.fetchPopularMovies { result in
            response = result
        }
        XCTAssertNotNil(response)
    }

    func testFetchTopRatedMovies() {
        let expectedResponse = MovieResponse(results: [])
        var response: Result<[Movie], Error>?
        apiManager.fetchTopRatedMovies { result in
            response = result
        }
        XCTAssertNotNil(response)
    }

    func testGetImageURL() {
        let path = "path/to/image.jpg"
        let url = apiManager.getImageURL(path: path)
        XCTAssertNotNil(url)
    }
}

