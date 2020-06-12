//
//  MovieDBReviewModel.swift
//  MovieProject
//
//  Created by Dave Harry on 12/06/20.
//  Copyright © 2020 Dave Harry. All rights reserved.
//

import Foundation

struct MovieDBReviewModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
        case results = "results"
        case id = "id"
        case totalResults = "total_results"
        case page = "page"
    }
    
    var totalPages: Int?
    var results: [MovieDBMovieReviewResults]?
    var id: Int?
    var totalResults: Int?
    var page: Int?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages)
        results = try container.decodeIfPresent([MovieDBMovieReviewResults].self, forKey: .results)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults)
        page = try container.decodeIfPresent(Int.self, forKey: .page)
    }
    
}

struct MovieDBMovieReviewResults: Codable {
    
    enum CodingKeys: String, CodingKey {
        case content = "content"
        case id = "id"
        case url = "url"
        case author = "author"
    }
    
    var content: String?
    var id: String?
    var url: String?
    var author: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        content = try container.decodeIfPresent(String.self, forKey: .content)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        author = try container.decodeIfPresent(String.self, forKey: .author)
    }
    
}
