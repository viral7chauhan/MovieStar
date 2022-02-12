//
//  MovieAdapter.swift
//  MovieStar
//
//  Created by Viral on 12/02/22.
//  Copyright © 2022 View The Space. All rights reserved.
//

import Foundation

struct MovieResponse: Codable {
    let results: [Movie]
}

typealias CallbackFunc = ([Movie]) -> Void

private extension ApiClient {
    func fetchMovies(callback: @escaping CallbackFunc) {
        let url = "https://api.themoviedb.org/3/movie/popular"
        execute(url) { data in
            let movies = try! JSONDecoder().decode(MovieResponse.self, from: data).results
            callback(movies)
        }
    }
}

class MovieListAdapter: MovieLoader {
    private lazy var mgr = ApiClient.instance

    func load(_ completion: @escaping ([MovieItemViewModel]) -> Void) {
        mgr.fetchMovies { foundMovies in
            let movieViewModels = foundMovies.map { movie in
                MovieItemViewModel(title: movie.title,
                                   subTitle: movie.releaseDate,
                                   imageUrl: movie.posterUrl,
                                   favorite: false)
            }
            completion(movieViewModels)
        }
    }
}

class MovieListFavoriteAdapter: MovieLoader {

    private(set) var favoriteModels = [MovieItemViewModel]()

    func onMovieSelection(_ item: MovieItemViewModel) {
        if item.favorite {
            favoriteModels.append(item)
        } else {
            favoriteModels.removeAll {
                item.title == $0.title
            }
        }
    }

    func load(_ completion: @escaping ([MovieItemViewModel]) -> Void) {
        completion(favoriteModels)
    }
}
