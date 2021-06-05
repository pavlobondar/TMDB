//
//  Movie.swift
//  Movies
//
//  Created by Pavlo Bondar on 05.06.2021.
//

import Foundation

struct Movie: Codable {
    let page: Int?
    let results: [MovieResult]?
}

struct MovieResult: Codable {
    let id: Int?
    let originalTitle: String?
    let overview: String?
    let posterPath: String?
    let releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
      }
}
