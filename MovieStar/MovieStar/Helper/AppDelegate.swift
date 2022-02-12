//
//  AppDelegate.swift
//  MovieStar
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        displayTabBarViewController()
        return true
    }

    private func displayTabBarViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootViewController()
        window?.makeKeyAndVisible()
    }

    private func rootViewController() -> MainTabBarController {
        return MainTabBarController()
    }
}
