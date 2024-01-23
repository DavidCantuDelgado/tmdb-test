//
//  Movie.swift
//  tmdb-test
//
//  Created by David Cantú Delgado on 19/01/24.
//

import SwiftUI

struct Movie: Decodable, Identifiable, Hashable {
    let id: Int
    let title: String
    let overview: String
    let release_date: String
    let poster_path: String?
    let vote_average: Double
}
