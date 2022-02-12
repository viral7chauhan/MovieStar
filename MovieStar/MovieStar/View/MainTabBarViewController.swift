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
        // First Movie List Controller
        let listAdapter = MovieListAdapter()

        let topMoviesViewController = topMovieListController()
        topMoviesViewController.serviceAdapter = listAdapter
        topMoviesViewController.onFavoriteClick = listAdapter.onMovieSelection

        // Second Movie List Controller
        let myMoviesViewController = favoriteListController()
        let favoriteAdapter = MovieListFavoriteAdapter(listAdapter: listAdapter)
        myMoviesViewController.serviceAdapter = favoriteAdapter

        viewControllers = [topMoviesViewController, myMoviesViewController]
        view.backgroundColor = .systemBackground
    }

    private func topMovieListController() -> ListViewController {
        let viewController = ListViewController()

        viewController.tabBarItem = UITabBarItem(title: "Top", image: #imageLiteral(resourceName: "star_outline"), selectedImage: #imageLiteral(resourceName: "star_filled"))

        return viewController
    }

    private func favoriteListController() -> ListViewController {
        let viewController = ListViewController()
        viewController.tableView.allowsSelection = false

        viewController.tabBarItem = UITabBarItem(title: "My Movies", image: #imageLiteral(resourceName: "movie_outline"), selectedImage: #imageLiteral(resourceName: "movie_filled"))

        return viewController
    }
}

extension MainTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if tabBarController.selectedIndex == 1,
            let myMoviesVC = (viewController as? ListViewController) {
            myMoviesVC.loadItems()
        }
    }
}
