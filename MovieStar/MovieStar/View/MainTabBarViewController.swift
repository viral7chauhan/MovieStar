//
//  MainTabBarViewController.swift
//  MovieStar
//
//  Created by Viral on 04/02/22.
//  Copyright © 2022 View The Space. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    convenience init() {
        self.init(nibName: nil, bundle: nil)
        self.setupViewControllers()
    }

    private func setupViewControllers() {
        let topMoviesViewController = ListViewController()
        topMoviesViewController.service = MovieManager()
        topMoviesViewController.tabBarItem = UITabBarItem(title: "Top", image: #imageLiteral(resourceName: "star_outline"), selectedImage: #imageLiteral(resourceName: "star_filled"))
        let myMoviesViewController = UIViewController()
        myMoviesViewController.tabBarItem = UITabBarItem(title: "My Movies", image: #imageLiteral(resourceName: "movie_outline"), selectedImage: #imageLiteral(resourceName: "movie_filled"))

        viewControllers = [topMoviesViewController, myMoviesViewController]
        view.backgroundColor = .systemBackground
    }
}
