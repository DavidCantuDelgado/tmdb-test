//
//  Functions.swift
//  tmdb-test
//
//  Created by David Cantú Delgado on 19/01/24.
//

import SwiftUI

func fetchMovies() async throws -> [Movie] {
    let apiauth = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYzUxMWUxOTQwNmI0MDNjZmNkMmNhZjUwNTM3ODMwYiIsInN1YiI6IjViZjM1YjEyMGUwYTI2MjY1YzA5MjcyZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BFDSYObw7NAI3JqKeaWgxXRc_MDlQw_7tT4dOGiHxas"
    let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=ec511e19406b403cfcd2caf50537830b&language=en-US&page=1")
    var request = URLRequest(url: url!)
    request.allHTTPHeaderFields = [
        "Authorization": "Bearer \(apiauth)",
        "Accept": "application/json",
        "Content-Type": "application/json"
        ]
    
    let (data, _) = try await URLSession.shared.data(for: request)
    
    let decodedResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
    return decodedResponse.results
}

func fetchSeries() async throws -> [Serie] {
    let apiauth = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYzUxMWUxOTQwNmI0MDNjZmNkMmNhZjUwNTM3ODMwYiIsInN1YiI6IjViZjM1YjEyMGUwYTI2MjY1YzA5MjcyZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BFDSYObw7NAI3JqKeaWgxXRc_MDlQw_7tT4dOGiHxas"
    let url = URL(string: "https://api.themoviedb.org/3/tv/on_the_air?api_key=ec511e19406b403cfcd2caf50537830b&language=en-US&page=1")
    var request = URLRequest(url: url!)
    request.allHTTPHeaderFields = [
        "Authorization": "Bearer \(apiauth)",
        "Accept": "application/json",
        "Content-Type": "application/json"
        ]
    
    let (data, _) = try await URLSession.shared.data(for: request)
    
    let decodedResponse = try JSONDecoder().decode(SerieResponse.self, from: data)
    return decodedResponse.results
}
