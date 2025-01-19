//
//  UserTableViewCell.swift
//  SevenAppsCase
//
//  Created by Emre GEMİCİ on 19.01.2025.
//

import Foundation
import UIKit

class UserTableViewCell: UITableViewCell {
    internal let initialsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = .systemGray5
        label.clipsToBounds = true
        label.layer.cornerRadius = 20
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal let emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ic_arrow_right")
        imageView.tintColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(initialsLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(emailLabel)
        contentView.addSubview(arrowImageView)
        
        NSLayoutConstraint.activate([
            initialsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            initialsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            initialsLabel.widthAnchor.constraint(equalToConstant: 40),
            initialsLabel.heightAnchor.constraint(equalToConstant: 40),
            
            nameLabel.leadingAnchor.constraint(equalTo: initialsLabel.trailingAnchor, constant: 12),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            
            emailLabel.leadingAnchor.constraint(equalTo: initialsLabel.trailingAnchor, constant: 12),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            emailLabel.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -8),
            
            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            arrowImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            arrowImageView.widthAnchor.constraint(equalToConstant: 14),
            arrowImageView.heightAnchor.constraint(equalToConstant: 14)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with user: UserModel) {
        let initials = user.name.split(separator: " ").compactMap { $0.first }.prefix(2).map(String.init).joined()
        initialsLabel.text = initials
        nameLabel.text = user.name
        emailLabel.text = user.email
    }
}
