//
//  MovieDBAPI.swift
//  MovieProject
//
//  Created by Dave Harry on 12/06/20.
//  Copyright © 2020 Dave Harry. All rights reserved.
//

import Foundation
import Moya

enum MovieAPI: TargetType {
    var headers: [String: String]? { return [:] }
    var baseURL: URL { return URL(string: Credential.URL.base)! }
    case getGenres
    case getDiscover(_ id: String, _ page: String)
    case getMovieDetail(_ id: String)
    case getVideo(_ id: String)
    case getReviews(_ id: String)
    
    var path: String {
        switch self {
        case .getGenres:
            return "/genre/movie/list"
        case .getDiscover:
            return "/discover/movie"
        case .getMovieDetail(let id):
            return "/movie/"+id
        case .getVideo(let id):
            return "/movie/"+id+"/videos"
        case .getReviews(let id):
            return "/movie/"+id+"/reviews"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getGenres,
             .getDiscover,
             .getMovieDetail,
             .getVideo,
             .getReviews:
            return .get
        }
    }
    
    var sampleData: Data { return Data() }
    var parameters: [String: Any]? {
        switch self {
        case .getGenres,
             .getMovieDetail,
             .getVideo,
             .getReviews:
            return [
                "api_key": Credential.apiKey,
                "language": Credential.lang
            ]
        case .getDiscover(let id, let page):
            return [
                "api_key": Credential.apiKey,
                "language": Credential.lang,
                "sort_by": "popularity.desc",
                "include_adult": "false",
                "include_video": "true",
                "page": page,
                "with_genres": id
            ]
        }
    }
    
    var task: Task {
        switch self {
        case .getGenres,
             .getDiscover,
             .getMovieDetail,
             .getVideo,
             .getReviews:
            return .requestParameters(parameters: parameters!, encoding: URLEncoding.queryString)
        }
    }
}
