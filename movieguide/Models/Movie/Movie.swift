//
//  Moview.swift
//  movieguide
//
//  Created by Luiz Aires Soares on 9/1/16.
//  Copyright © 2016 ArcTouch. All rights reserved.
//

import Foundation
import Mapper

struct Movie: Mappable {
    let adult: Bool?
    let backdrop: String?
    let genres: [Genre]?
    let id: Int?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let releaseDate: String?
    let poster: String?
    let popularity: Double?
    let title: String?
    let video: Bool?
    let voteAvg: Double?
    let voteCount: Double?
    
    init(map: Mapper) {
        self.adult = map.optionalFrom("adult")
        self.backdrop = map.optionalFrom("backdrop_path")
        self.genres = map.optionalFrom("genres")
        self.id = map.optionalFrom("id")
        self.originalLanguage = map.optionalFrom("original_language")
        self.originalTitle = map.optionalFrom("original_title")
        self.overview = map.optionalFrom("overview")
        self.releaseDate = map.optionalFrom("release_date")
        self.poster =  map.optionalFrom("poster_path")
        self.popularity = map.optionalFrom("popularity")
        self.title = map.optionalFrom("title")
        self.video = map.optionalFrom("video")
        self.voteAvg = map.optionalFrom("vote_average")
        self.voteCount = map.optionalFrom("vote_count")
    }
}
