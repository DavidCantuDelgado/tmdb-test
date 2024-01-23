//
//  MoviesView.swift
//  tmdb-test
//
//  Created by David Cantú Delgado on 22/01/24.
//

import SwiftUI

struct MoviesView: View {
    @State var movies = [Movie]()
    
    var body: some View {
        
        VStack {
            if movies.count > 0 {
                List(movies) { movie in
                    NavigationLink(value: movie) {
                        MovieRowView(movie: movie)
                    }
                }
                
            } else {
                Text("No movies")
            }
        }
        .onAppear(perform: {
            print("Task")
            Task {
                do {
                    movies = try await fetchMovies()
                } catch {
                    print("Fetch failed: \(error.localizedDescription)")
                }
            }
        })
        .padding(.horizontal, 20)
        .navigationTitle("Películas")
        .listStyle(.inset)
        .navigationDestination(for: Movie.self) { movie in
            MovieDetailView(movie: movie)
        }
        
        
        
        
    }
}

#Preview {
    MoviesView()
}
