//
//  UserDetailViewController.swift
//  SevenAppsCase
//
//  Created by Emre GEMİCİ on 19.01.2025.
//

import Foundation
import UIKit

class UserDetailViewController: UIViewController {
    // MARK: - Properties
    private let user: UserModel

    // MARK: - Initializer
    init(user: UserModel) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }

    // MARK: - Required Initializer
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    // MARK: - UI
    private func setupUI() {
        view.backgroundColor = .white

        // Profile Placeholder
        let profilePlaceholderView = createProfilePlaceholder()
        let nameLabel = createLabel(text: user.name, fontSize: 20, fontWeight: .bold, color: .black, alignment: .center)
        let emailLabel = createLabel(text: user.email ?? "-", fontSize: 14, fontWeight: .regular, color: .gray, alignment: .center)
        let phoneStackView = createIconWithTextStack(iconName: "phone.fill", text: user.phone ?? "-", iconSize: 16)
        let websiteStackView = createIconWithTextStack(iconName: "ic_link", text: user.website ?? "-", iconSize: 20, color: .blue)

        // Add to View
        view.addSubview(profilePlaceholderView)
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        view.addSubview(phoneStackView)
        view.addSubview(websiteStackView)

        // Constraints
        NSLayoutConstraint.activate([
            // Profile Placeholder Constraints
            profilePlaceholderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profilePlaceholderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profilePlaceholderView.widthAnchor.constraint(equalToConstant: 100),
            profilePlaceholderView.heightAnchor.constraint(equalToConstant: 100),

            // Name Label Constraints
            nameLabel.topAnchor.constraint(equalTo: profilePlaceholderView.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            // Email Label Constraints
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            // Phone StackView Constraints
            phoneStackView.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            phoneStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            // Website StackView Constraints
            websiteStackView.topAnchor.constraint(equalTo: phoneStackView.bottomAnchor, constant: 20),
            websiteStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    /// Creates a circular profile placeholder view with the user's initials.
    /// The placeholder has the following features:
    /// - Background color set to a light gray (`systemGray5`).
    /// - Rounded corners to form a circular shape.
    /// - Displays the user's initials centered within the placeholder.
    /// - Initials are extracted from the first two words of the user's name.
    private func createProfilePlaceholder() -> UIView {
        let profilePlaceholderView = UIView()
        profilePlaceholderView.backgroundColor = .systemGray5
        profilePlaceholderView.layer.cornerRadius = 50
        profilePlaceholderView.clipsToBounds = true
        profilePlaceholderView.translatesAutoresizingMaskIntoConstraints = false

        let initialsLabel = createLabel(
            text: user.name.split(separator: " ").compactMap { $0.first }.prefix(2).map(String.init).joined(),
            fontSize: 30,
            fontWeight: .bold,
            color: .white,
            alignment: .center
        )
        profilePlaceholderView.addSubview(initialsLabel)

        NSLayoutConstraint.activate([
            initialsLabel.centerXAnchor.constraint(equalTo: profilePlaceholderView.centerXAnchor),
            initialsLabel.centerYAnchor.constraint(equalTo: profilePlaceholderView.centerYAnchor)
        ])

        return profilePlaceholderView
    }

    /// Creates a `UILabel` with the specified text, font size, weight, color, and alignment.
    /// - Parameters:
    ///   - text: The text to display in the label.
    ///   - fontSize: The size of the font.
    ///   - fontWeight: The weight of the font.
    ///   - color: The color of the text.
    ///   - alignment: The text alignment.
    /// - Returns: A configured `UILabel`.
    private func createLabel(text: String, fontSize: CGFloat, fontWeight: UIFont.Weight, color: UIColor, alignment: NSTextAlignment) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        label.textColor = color
        label.textAlignment = alignment
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    /// Creates a horizontal stack view with an icon and a label.
    /// - Parameters:
    ///   - iconName: Name of the icon (system or asset image).
    ///   - text: Text displayed next to the icon.
    ///   - iconSize: Size of the icon (width and height).
    ///   - color: Color of the icon and text (default: `.gray`).
    /// - Returns: A `UIStackView` with the configured icon and label.
    private func createIconWithTextStack(iconName: String, text: String, iconSize: CGFloat, color: UIColor = .gray) -> UIStackView {
        let icon = UIImageView()
        
        if let systemImage = UIImage(systemName: iconName) {
            icon.image = systemImage
        } else if let assetImage = UIImage(named: iconName) {
            icon.image = assetImage
        } else {
            icon.image = nil
        }
        icon.tintColor = color
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            icon.widthAnchor.constraint(equalToConstant: iconSize),
            icon.heightAnchor.constraint(equalToConstant: iconSize)
        ])

        let label = createLabel(text: text, fontSize: 14, fontWeight: .regular, color: color, alignment: .left)

        let stackView = UIStackView(arrangedSubviews: [icon, label])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false

        return stackView
    }
    
}
