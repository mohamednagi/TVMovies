//
//  MoviesModel.swift
//  TVMovies
//
//  Created by Nagiz on 23/12/2021.
//

import Foundation

struct MovieData : Codable {
    let score : Double
    let show : Show

    enum CodingKeys: String, CodingKey {

        case score = "score"
        case show = "show"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        score = try values.decodeIfPresent(Double.self, forKey: .score) ?? 0
        show = try values.decodeIfPresent(Show.self, forKey: .show) ?? Show(from: decoder)
    }

}
