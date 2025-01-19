//
//  UserListViewModel.swift
//  SevenAppsCase
//
//  Created by Emre GEMİCİ on 19.01.2025.
//

import Foundation

class UserListViewModel {
    private var users: [UserModel] = []
    var filteredUsers: [UserModel] = []

    var reloadTableView: (() -> Void)?

    func fetchUsers() {
        NetworkManager.shared.fetchUsers { [weak self] result in
            switch result {
            case .success(let users):
                self?.users = users
                self?.filteredUsers = users
                self?.reloadTableView?()
            case .failure(let error):
                print("Error fetching users: \(error)")
            }
        }
    }

    func user(at indexPath: IndexPath) -> UserModel {
        return filteredUsers[indexPath.row]
    }

    var userCount: Int {
        return filteredUsers.count
    }
}
