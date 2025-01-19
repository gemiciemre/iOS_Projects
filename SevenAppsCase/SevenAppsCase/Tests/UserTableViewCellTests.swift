//
//  UserTableViewCellTests.swift
//  SevenAppsCaseTests
//
//  Created by Emre GEMİCİ on 19.01.2025.
//

import XCTest
@testable import SevenAppsCase

final class UserTableViewCellTests: XCTestCase {
    var cell: UserTableViewCell!
    var tableView: UITableView!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        tableView = UITableView()
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserCell")
        cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as? UserTableViewCell
    }

    override func tearDownWithError() throws {
        cell = nil
        tableView = nil
        try super.tearDownWithError()
    }
    
    func testCellConfiguration() throws {
        // Given
        let user = UserModel(
            id: 1,
            name: "Emre Gemici",
            email: "emregemici@example.com",
            phone: "123-456-7890",
            website: "www.example.com"
        )
        
        // When
        cell.configure(with: user)
        
        // Then
        XCTAssertEqual(cell.initialsLabel.text, "EG", "Initials should be the first letters of the user's name.")
        XCTAssertEqual(cell.nameLabel.text, "Emre Gemici", "Name label should display the user's full name.")
        XCTAssertEqual(cell.emailLabel.text, "emregemici@example.com", "Email label should display the user's email.")
    }
    
    func testInitialsLabelAppearance() throws {
        // Given
        let user = UserModel(
            id: 1,
            name: "Enes Gemici",
            email: "enesgemici@example.com",
            phone: "123-456-7890",
            website: "www.example.com"
        )
        
        // When
        cell.configure(with: user)
        
        // Then
        XCTAssertEqual(cell.initialsLabel.backgroundColor, UIColor.systemGray5, "Initials label should have the correct background color.")
        XCTAssertEqual(cell.initialsLabel.layer.cornerRadius, 20, "Initials label should have the correct corner radius.")
        XCTAssertEqual(cell.initialsLabel.textAlignment, .center, "Initials label text should be centered.")
    }
    
    func testArrowImageViewAppearance() throws {
        // Given
        let expectedImage = UIImage(named: "ic_arrow_right")
        
        // Then
        XCTAssertEqual(cell.arrowImageView.image, expectedImage, "Arrow image should be correctly set.")
        XCTAssertEqual(cell.arrowImageView.tintColor, .gray, "Arrow image should have the correct tint color.")
    }
}
