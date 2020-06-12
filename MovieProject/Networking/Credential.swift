//
//  Credential.swift
//  MovieProject
//
//  Created by Dave Harry on 12/06/20.
//  Copyright © 2020 Dave Harry. All rights reserved.
//

import Foundation

struct Credential {
    static let apiKey = "f3bd1237cf5aa832d942111f905f7284"
    static let lang = "en-US"
    
    struct URL {
        static let base = "http://api.themoviedb.org/3"
        static let basePoster = "http://image.tmdb.org/t/p/w500"
        static let baseYoutube = "http://www.youtube.com/embed/"
    }
}
