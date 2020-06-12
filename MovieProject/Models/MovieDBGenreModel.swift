//
//  MovieDBGenreModel.swift
//  MovieProject
//
//  Created by Dave Harry on 12/06/20.
//  Copyright © 2020 Dave Harry. All rights reserved.
//

import Foundation
import Mapper

struct MovieDBGenreModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case genres = "genres"
    }
    
    var genres: [MovieDBGenres]?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        genres = try container.decodeIfPresent([MovieDBGenres].self, forKey: .genres)
    }
    
}

struct MovieDBGenres: Codable {
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case id = "id"
    }
    
    var name: String?
    var id: Int?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
    }
    
}

