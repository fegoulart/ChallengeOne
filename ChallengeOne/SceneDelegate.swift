//
//  SceneDelegate.swift
//  ChallengeOne
//
//  Created by Fernando Luiz Goulart on 30/03/22.
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
        let windows = UIWindow(windowScene: windowScene)

        let localRepository = LocalRepository()
        let viewModel = ViewModel(repository: localRepository)
        let viewController = ViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)

        windows.rootViewController = navigationController
        self.window = windows
        windows.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}
