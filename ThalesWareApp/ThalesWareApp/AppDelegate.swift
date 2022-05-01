//
//  AppDelegate.swift
//  ThalesWareApp
//
//  Created by Thales Alcantara Rocha on 12/04/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupNavigation()
        return true
    }

    private func setupNavigation() {
        let navigationController = UINavigationController()
        
        let coordinator = AppCoordinator(navigationController: navigationController)
        coordinator.start()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

