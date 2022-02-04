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
        let topMoviesViewController = UIViewController()
        topMoviesViewController.tabBarItem = UITabBarItem(title: "Top", image: #imageLiteral(resourceName: "star_outline"), selectedImage: #imageLiteral(resourceName: "star_filled"))
        let myMoviesViewController = UIViewController()
        myMoviesViewController.tabBarItem = UITabBarItem(title: "My Movies", image: #imageLiteral(resourceName: "movie_outline"), selectedImage: #imageLiteral(resourceName: "movie_filled"))
        let tabController = UITabBarController()
        tabController.viewControllers = [topMoviesViewController, myMoviesViewController]
        tabController.view.backgroundColor = .systemBackground
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabController
        window?.makeKeyAndVisible()
        MovieManager().fetchMovies { movies in
            print(movies)
        }
    }
}
