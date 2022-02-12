//
//  Movie.swift
//  MovieStar
//
//  Created by Alex Weisberger on 11/27/18.
//  Copyright © 2018 View The Space. All rights reserved.
//

import Foundation

struct Movie: Codable {
    let posterPath: String
    let title: String
    let releaseDate: String
    
    var posterUrl: URL {
        get {
            return Helpers.posterUrl(from: posterPath)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
    }
}
