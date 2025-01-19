//
//  UserModel.swift
//  SevenAppsCase
//
//  Created by Emre GEMİCİ on 19.01.2025.
//

import Foundation

struct UserModel: Codable {
    let id: Int
    let name: String
    let email: String?
    let phone: String?
    let website: String?
}
