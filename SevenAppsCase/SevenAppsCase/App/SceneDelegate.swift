//
//  SceneDelegate.swift
//  SevenAppsCase
//
//  Created by Emre GEMİCİ on 19.01.2025.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        let userListVC = UserListViewController()
        let navigationController = UINavigationController(rootViewController: userListVC)

        window.rootViewController = navigationController
        self.window = window
        window.makeKeyAndVisible()
    }

}

