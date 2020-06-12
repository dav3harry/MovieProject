//
//  MovieDBDiscoverModel.swift
//  MovieProject
//
//  Created by Dave Harry on 12/06/20.
//  Copyright © 2020 Dave Harry. All rights reserved.
//

import Foundation

struct MovieDBDiscoverModel: Codable {
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case page = "page"
    }
    
    var results: [MovieDBDiscoverResults]?
    var totalResults: Int?
    var totalPages: Int?
    var page: Int?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        results = try container.decodeIfPresent([MovieDBDiscoverResults].self, forKey: .results)
        totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults)
        totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages)
        page = try container.decodeIfPresent(Int.self, forKey: .page)
    }
    
}

struct MovieDBDiscoverResults: Codable {
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case posterPath = "poster_path"
        case genreIds = "genre_ids"
        case id = "id"
        case originalLanguage = "original_language"
        case voteAverage = "vote_average"
        case video = "video"
        case popularity = "popularity"
        case backdropPath = "backdrop_path"
        case adult = "adult"
        case releaseDate = "release_date"
        case voteCount = "vote_count"
        case originalTitle = "original_title"
        case overview = "overview"
    }
    
    var title: String?
    var posterPath: String?
    var genreIds: [Int]?
    var id: Int?
    var originalLanguage: String?
    var voteAverage: Float?
    var video: Bool?
    var popularity: Float?
    var backdropPath: String?
    var adult: Bool?
    var releaseDate: String?
    var voteCount: Int?
    var originalTitle: String?
    var overview: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
        genreIds = try container.decodeIfPresent([Int].self, forKey: .genreIds)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage)
        voteAverage = try container.decodeIfPresent(Float.self, forKey: .voteAverage)
        video = try container.decodeIfPresent(Bool.self, forKey: .video)
        popularity = try container.decodeIfPresent(Float.self, forKey: .popularity)
        backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
        adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
        releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
        originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
        overview = try container.decodeIfPresent(String.self, forKey: .overview)
    }
    
}

