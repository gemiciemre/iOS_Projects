//
//  UserListViewModelTests.swift
//  SevenAppsCaseTests
//
//  Created by Emre GEMİCİ on 19.01.2025.
//

import XCTest
@testable import SevenAppsCase

class UserListViewModelTests: XCTestCase {
    /// Tests the `fetchUsers` method to ensure it fetches users from the API and updates the view model.
    func testFetchUsers() {
        let expectation = XCTestExpectation(description: "Fetch users from API")
        let viewModel = UserListViewModel()

        /// Checks if `reloadTableView` is triggered and user count is greater than 0 after fetching.
        viewModel.reloadTableView = {
            XCTAssertGreaterThan(viewModel.userCount, 0)
            expectation.fulfill()
        }

        viewModel.fetchUsers()
        wait(for: [expectation], timeout: 5.0)
    }
}
