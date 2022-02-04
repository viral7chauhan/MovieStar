//
//  MainTabBarViewController.swift
//  MovieStar
//
//  Created by Viral on 04/02/22.
//  Copyright © 2022 View The Space. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    let manager = MovieManager()

    convenience init() {
        self.init(nibName: nil, bundle: nil)
        self.setupViewControllers()
        delegate = self
    }

    private func setupViewControllers() {
        let topMoviesViewController = ListViewController()
        topMoviesViewController.service = manager
        topMoviesViewController.tabBarItem = UITabBarItem(title: "Top", image: #imageLiteral(resourceName: "star_outline"), selectedImage: #imageLiteral(resourceName: "star_filled"))
        let myMoviesViewController = ListViewController()
        myMoviesViewController.items = manager.favoriteModels
        myMoviesViewController.tabBarItem = UITabBarItem(title: "My Movies", image: #imageLiteral(resourceName: "movie_outline"), selectedImage: #imageLiteral(resourceName: "movie_filled"))

        viewControllers = [topMoviesViewController, myMoviesViewController]
        view.backgroundColor = .systemBackground
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let tabBarIndex = tabBarController.selectedIndex
        if tabBarIndex == 1,
        let myMoviesVC = (viewController as? ListViewController) {
            myMoviesVC.items = manager.favoriteModels
            myMoviesVC.tableView.allowsSelection = false
            myMoviesVC.tableView.reloadData()
        }
    }
}
