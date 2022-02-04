//
//  MovieManager.swift
//  MovieStar
//

import Alamofire
import Foundation

struct MovieResponse: Codable {
    let results: [Movie]
}

typealias CallbackFunc = ([Movie]) -> Void

final class MovieManager {
    static let tmdbApiKey = "78a6a340867805be8573b2ec1789df75"
    var favoriteModels = [MovieItemViewModel]()


    func fetchMovies(callback: @escaping CallbackFunc) {
        let url = "https://api.themoviedb.org/3/movie/popular"
        let params = [
            "api_key": MovieManager.tmdbApiKey
        ]
        AF.request(url, method: .get, parameters: params).validate().responseData() { response in
            switch response.result {
            case .success(let data):
                let movies = try! JSONDecoder().decode(MovieResponse.self, from: data).results
                callback(movies)
            case .failure: ()
            }
        }
    }
}

extension MovieManager: MovieService {
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
        if favoriteModels.isEmpty {
            fetchMovies { foundMovies in
                let movieViewModels = foundMovies.map { movie in
                    MovieItemViewModel(title: movie.title,
                                       subTitle: movie.releaseDate,
                                       imageUrl: movie.posterUrl,
                                       favorite: false)
                }
                completion(movieViewModels)
            }
        } else {
            completion(favoriteModels)
        }

    }
}
