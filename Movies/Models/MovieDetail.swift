//
//  MovieDetail.swift
//  Movies
//
//  Created by Pavlo Bondar on 05.06.2021.
//

import Foundation

struct MovieDetail: Codable {
    let id: Int?
    let genres: [Genre]?
    let overview: String?
    let title: String?
}

struct Genre: Codable {
    let id: Int?
    let name: String?
}
