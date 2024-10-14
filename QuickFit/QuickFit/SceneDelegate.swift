//
//  SceneDelegate.swift
//  QuickFit
//
//  Created by Adam Abukhdair on 7/16/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)
        let mainTabBarController = MainTabBarController()
        window.rootViewController = mainTabBarController
        self.window = window
        window.makeKeyAndVisible()
    }
}
