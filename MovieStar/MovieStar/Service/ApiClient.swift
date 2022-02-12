//
//  MovieManager.swift
//  MovieStar
//

import Alamofire
import Foundation

final class ApiClient {
    static let instance = ApiClient()

    static let tmdbApiKey = "78a6a340867805be8573b2ec1789df75"

    func execute(_ url: URLConvertible, completion: @escaping (Data) -> Void) {
        let params = [
            "api_key": ApiClient.tmdbApiKey
        ]
        AF.request(url, method: .get, parameters: params).validate().responseData() { response in
            switch response.result {
                case let .success(data):
                    completion(data)
                case .failure: ()
            }
        }
    }
}
