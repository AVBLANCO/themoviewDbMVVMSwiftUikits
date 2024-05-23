//
//  PopularViewControllerTests.swift
//  themoviewDbMVVMSwiftUikitsTests
//
//  Created by Sergio Luis Noriega Pita on 23/05/24.
//

import XCTest
@testable import themoviewDbMVVMSwiftUikits

final class PopularViewControllerTests: XCTestCase {
    var sut: PopularViewController!
    var viewModel: PopularViewModelMock!

    override func setUp() {
        super.setUp()
        viewModel = PopularViewModelMock()
        sut = PopularViewController()
        sut.viewModel = viewModel
    }


    override func tearDown() {
        super.tearDown()
    }
    func testViewDidLoad() {
        sut.viewDidLoad()
        XCTAssertNotNil(sut.tableView)
        XCTAssertNotNil(sut.searchBar)
        XCTAssertNotNil(sut.filterView)
    }
    
    func testSetupSearchBar() {
        sut.setupSearchBar()
        XCTAssertNotNil(sut.searchBar?.delegate)
    }
    
    func testSetupFilterView() {
        sut.setupFilterView()
        XCTAssertNotNil(sut.filterView)
    }
    
    func testSetupTableView() {
        sut.setupTableView()
        XCTAssertNotNil(sut.tableView?.delegate)
        XCTAssertNotNil(sut.tableView?.dataSource)
    }
    func testFetchPopularMovies() {
        sut.fetchPopularMovies()
        XCTAssertNotNil(viewModel.popularMovies)
    }
    
    func testSearchBarDelegate() {
        let searchText = "test"
        sut.searchBar?.text = searchText
        sut.searchBar?.textDidChange?(sut.searchBar!, textDidChange: searchText)
        XCTAssertNotNil(sut.filteredMovies)
    }
    
    func testTableViewDataSource() {
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView?.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! PopularTableViewCell
        XCTAssertNotNil(cell)
    }
    
    
    func testTableViewDelegate() {
        let indexPath = IndexPath(row: 0, section: 0)
        sut.tableView?.selectRow(at: indexPath, animated: true)
        XCTAssertNotNil(sut.tableView?.selectedRow)
    }
}
