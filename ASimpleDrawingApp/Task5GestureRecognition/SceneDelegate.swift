//
//  SceneDelegate.swift
//  Task5GestureRecognition
//
//  Created by Tymofii (Work) on 03.10.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = DrawingViewController()
        window.makeKeyAndVisible()
        
        self.window = window
    }
}

