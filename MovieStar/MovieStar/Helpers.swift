//
//  Helpers.swift
//  MovieStar
//

import Foundation

struct Helpers {
    static func posterUrl(from path: String) -> URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(path)")!
    }
}

