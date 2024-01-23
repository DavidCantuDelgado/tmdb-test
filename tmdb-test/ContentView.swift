//
//  ContentView.swift
//  tmdb-test
//
//  Created by David Cantú Delgado on 19/01/24.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        NavigationStack {
            VStack {
                TabView {
                    MoviesView()
                        .tabItem {
                            Label("Movies", systemImage: "film")
                        }
                    SeriesView()
                        .tabItem {
                            Label("Series", systemImage: "tv")
                        }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Películas / Series")
            
        }
        
        
    }
    
    
}

#Preview {
    ContentView()
}
