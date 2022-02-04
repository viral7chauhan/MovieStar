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
        MovieManager().fetchMovies { movies in
            print(movies)
        }
    }

    private func rootViewController() -> MainTabBarController {
        return MainTabBarController()
    }
}


class MainTabBarController: UITabBarController {
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        self.setupViewControllers()
    }

    private func setupViewControllers() {
        let topMoviesViewController = ListViewController()
        topMoviesViewController.tabBarItem = UITabBarItem(title: "Top", image: #imageLiteral(resourceName: "star_outline"), selectedImage: #imageLiteral(resourceName: "star_filled"))
        let myMoviesViewController = UIViewController()
        myMoviesViewController.tabBarItem = UITabBarItem(title: "My Movies", image: #imageLiteral(resourceName: "movie_outline"), selectedImage: #imageLiteral(resourceName: "movie_filled"))

        viewControllers = [topMoviesViewController, myMoviesViewController]
        view.backgroundColor = .systemBackground
    }
}
