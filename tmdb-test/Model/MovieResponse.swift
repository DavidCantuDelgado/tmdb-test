//
//  MovieResponse.swift
//  tmdb-test
//
//  Created by David Cantú Delgado on 19/01/24.
//

import SwiftUI

struct MovieResponse: Decodable {
    let results: [Movie]
}
