//
//  TopRatedViewControllerTests.swift
//  themoviewDbMVVMSwiftUikitsTests
//
//  Created by Sergio Luis Noriega Pita on 23/05/24.
//

import XCTest
import UIKit
@testable import themoviewDbMVVMSwiftUikits

class TopRatedViewControllerTests: XCTestCase {

    var sut: TopRatedViewController!
    var viewModelMock: TopRatedViewModelMock!

    override func setUpWithError() throws {
        
        sut = TopRatedViewController()
        viewModelMock = TopRatedViewModelMock()
        sut.viewModel = viewModelMock
    }

    func testSetupBindings() {
        let expectation = XCTestExpectation(description: "Setup bindings")
        viewModelMock.topRatedMovies = [Movie(title: "Movie 1"), Movie(title: "Movie 2")]
        sut.setupBindings()
        wait(for: [expectation], timeout: 1)
        XCTAssertNotNil(sut.collectionView)
    }

    func testFetchTopRatedMovies() {

        let expectation = XCTestExpectation(description: "Fetch top rated movies")
        
        sut.fetchTopRatedMovies()
        wait(for: [expectation], timeout: 1)
        XCTAssertNotNil(viewModelMock.topRatedMovies)
    }

    func testSearchBarDelegate() {

        let expectation = XCTestExpectation(description: "Search bar delegate")
        let searchBar = UISearchBar()
        sut.searchBar = searchBar
        searchBar.delegate = sut
        searchBar.text = "Movie 1"
        wait(for: [expectation], timeout: 1)
        XCTAssertNotNil(sut.filteredMovies)
    }

    func testCollectionViewDataSource() {
        let expectation = XCTestExpectation(description: "Collection view data source")
        let _ = sut.collectionView.dataSource
        wait(for: [expectation], timeout: 1)
        XCTAssertNotNil(sut.collectionView.dataSource)
    }
}

class TopRatedViewModelMock: TopRatedViewModel {
    var topRatedMovies: [Movie] = []
}

