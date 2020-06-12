//
//  MovieDBMovieModel.swift
//  MovieProject
//
//  Created by Dave Harry on 12/06/20.
//  Copyright © 2020 Dave Harry. All rights reserved.
//

import Foundation

struct MovieDBMovieModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
        case id = "id"
    }
    
    var results: [MovieDBMovieVideoResults]?
    var id: Int?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        results = try container.decodeIfPresent([MovieDBMovieVideoResults].self, forKey: .results)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
    }
    
}

struct MovieDBMovieVideoResults: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case name = "name"
        case site = "site"
        case key = "key"
        case size = "size"
        case iso6391 = "iso_639_1"
        case iso31661 = "iso_3166_1"
    }
    
    var id: String?
    var type: String?
    var name: String?
    var site: String?
    var key: String?
    var size: Int?
    var iso6391: String?
    var iso31661: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id)
        type = try container.decodeIfPresent(String.self, forKey: .type)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        site = try container.decodeIfPresent(String.self, forKey: .site)
        key = try container.decodeIfPresent(String.self, forKey: .key)
        size = try container.decodeIfPresent(Int.self, forKey: .size)
        iso6391 = try container.decodeIfPresent(String.self, forKey: .iso6391)
        iso31661 = try container.decodeIfPresent(String.self, forKey: .iso31661)
    }
    
}
