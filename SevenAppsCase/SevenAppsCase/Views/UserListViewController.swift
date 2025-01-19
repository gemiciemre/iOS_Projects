//
//  UserListViewController.swift
//  SevenAppsCase
//
//  Created by Emre GEMİCİ on 19.01.2025.
//

import Foundation
import UIKit

class UserListViewController: UIViewController {
    private let tableView = UITableView()
    private let viewModel = UserListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        viewModel.fetchUsers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: false)
        }
    }
    
    /// Sets up the UI components for the view, including the table view and its configuration.
    private func setupUI() {
        title = "Users"
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserCell")
    }

    /// Sets up bindings between the view model and the table view, ensuring the UI updates correctly.
    private func setupBindings() {
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                self?.showEmptyStateIfNeeded()
                self?.tableView.reloadData()
            }
        }
    }
}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        let user = viewModel.user(at: indexPath)
        cell.configure(with: user)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = viewModel.user(at: indexPath)
        let detailVC = UserDetailViewController(user: user)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension UserListViewController {
    
    /// Displays a "No users available" message if the user list is empty.
    private func showEmptyStateIfNeeded() {
        if viewModel.userCount == 0 {
            let emptyLabel = UILabel()
            emptyLabel.text = "No users available."
            emptyLabel.font = UIFont.systemFont(ofSize: 18)
            emptyLabel.textColor = .gray
            emptyLabel.textAlignment = .center
            tableView.backgroundView = emptyLabel
        } else {
            tableView.backgroundView = nil
        }
    }
    
}
