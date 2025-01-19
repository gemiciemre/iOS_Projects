//
//  UserDetailViewControllerTests.swift
//  SevenAppsCaseTests
//
//  Created by Emre GEMİCİ on 19.01.2025.
//

import XCTest
@testable import SevenAppsCase

final class UserDetailViewControllerTests: XCTestCase {
    var sut: UserDetailViewController!
    var userModel: UserModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        userModel = UserModel(
            id: 1,
            name: "Emre Gemici",
            email: "emregemici@example.com",
            phone: "123-456-7890",
            website: "www.example.com"
        )
        
        sut = UserDetailViewController(user: userModel)
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        userModel = nil
        try super.tearDownWithError()
    }
    /// Unit tests for verifying the behavior of a view controller and its labels.
    func testViewControllerLoadsCorrectly() {
        /// Ensures the view controller's view is loaded successfully.
        XCTAssertNotNil(sut.view, "View Controller could not be loaded.")
    }

    func testNameLabelDisplaysCorrectText() {
        /// Verifies that the name label exists and displays the correct text.
        let nameLabel = sut.view.subviews.compactMap { $0 as? UILabel }.first { $0.text == "Emre Gemici" }
        XCTAssertNotNil(nameLabel, "Name label doesn't show Emre Gemici.")
        XCTAssertEqual(nameLabel?.text, userModel.name, "The text in the name label is wrong.")
    }

    func testEmailLabelDisplaysCorrectText() {
        /// Verifies that the email label exists and displays the correct text.
        let emailLabel = sut.view.subviews.compactMap { $0 as? UILabel }.first { $0.text == "emregemici@example.com" }
        XCTAssertNotNil(emailLabel, "Email label does not show emregemici@example.com.")
        XCTAssertEqual(emailLabel?.text, userModel.email, "The text in the email label is wrong.")
    }
}
