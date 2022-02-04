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

struct MovieManager {
    static let tmdbApiKey = "78a6a340867805be8573b2ec1789df75"
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
    
    func load(_ completion: @escaping ([MovieItemViewModel]) -> Void) {
        fetchMovies { foundMovies in
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
