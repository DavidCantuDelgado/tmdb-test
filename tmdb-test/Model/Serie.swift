//
//  Serie.swift
//  tmdb-test
//
//  Created by David Cantú Delgado on 22/01/24.
//

import SwiftUI

struct Serie: Decodable, Identifiable, Hashable {
    let id: Int
    let name: String
    let overview: String
    let first_air_date: String
    let poster_path: String?
    let vote_average: Double
}

