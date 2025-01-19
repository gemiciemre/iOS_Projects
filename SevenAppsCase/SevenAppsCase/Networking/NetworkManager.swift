//
//  NetworkManager.swift
//  SevenAppsCase
//
//  Created by Emre GEMİCİ on 19.01.2025.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://jsonplaceholder.typicode.com"

    private init() {}

    func fetchUsers(completion: @escaping (Result<[UserModel], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/users") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
                return
            }
            do {
                let users = try JSONDecoder().decode([UserModel].self, from: data)
                completion(.success(users))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
