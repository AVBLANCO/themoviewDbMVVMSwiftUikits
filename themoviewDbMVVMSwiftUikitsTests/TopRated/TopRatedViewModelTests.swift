//
//  TopRatedViewModelTests.swift
//  themoviewDbMVVMSwiftUikitsTests
//
//  Created by Sergio Luis Noriega Pita on 23/05/24.
//

import Foundation
import XCTest
@testable import themoviewDbMVVMSwiftUikits

class TopRatedViewModelTests: XCTestCase {

    var viewModel: TopRatedViewModel!
    override func setUp() {
        super.setUp()
        viewModel = TopRatedViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testFetchTopRatedMoviesSuccess() {
        let expectation = XCTestExpectation(description: "Buscar las películas mejor valoradas"")
        let mockAPI = MockAPI() // Create a mock API to return some sample data
        viewModel.api = mockAPI
        viewModel.fetchTopRatedMovies()

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {

            XCTAssertNotNil(self.viewModel.topRatedMovies)
            XCTAssertGreaterThan(self.viewModel.topRatedMovies.count, 0)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }

    func testFetchTopRatedMoviesFailure() {
        let expectation = XCTestExpectation(description: "Buscar las películas mejor valoradas"")
        let error = NSError(domain: "Error", code: 0, userInfo: nil)
        let mockAPI = MockAPI() // Create a mock API to return an error
        mockAPI.error = error
        viewModel.api = mockAPI
        viewModel.fetchTopRatedMovies()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {

            
            XCTAssert(self.viewModel.topRatedMovies.isEmpty)
            XCTAssertNotNil(self.viewModel.error)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10.0)
    }
}


