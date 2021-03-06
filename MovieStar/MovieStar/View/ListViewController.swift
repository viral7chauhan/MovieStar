//
//  ListViewController.swift
//  MovieStar
//
//  Created by Viral on 04/02/22.
//  Copyright © 2022 View The Space. All rights reserved.
//

import UIKit

protocol MovieLoader {
    func load(_ completion: @escaping ([MovieItemViewModel]) -> Void)
}

class ListViewController: UITableViewController {

    var serviceAdapter: MovieLoader?
    var onFavoriteClick: ((MovieItemViewModel) -> Void)?
    private var items = [MovieItemViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(MovieCell.nib, forCellReuseIdentifier: MovieCell.resuableIdentifier)
        tableView.rowHeight = 140
        tableView.estimatedRowHeight = UITableView.automaticDimension

        loadItems()
    }

    func loadItems() {
        serviceAdapter?.load({ models in
            DispatchQueue.main.async { [weak self] in
                self?.items = models
                self?.tableView.reloadData()
            }
        })
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.resuableIdentifier, for: indexPath) as? MovieCell {
            cell.configure(items[indexPath.row])
            cell.favoriteImg.isHidden = !tableView.allowsSelection
            return cell
        }
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        items[indexPath.row].favorite.toggle()
        onFavoriteClick?(items[indexPath.row])
        tableView.reloadRows(at: [indexPath], with: .none)
    }
}

struct MovieItemViewModel {
    let title: String
    let subTitle: String
    let imageUrl: URL
    var favorite: Bool
}

