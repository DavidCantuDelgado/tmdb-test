//
//  SeriesView.swift
//  tmdb-test
//
//  Created by David Cantú Delgado on 22/01/24.
//

import SwiftUI

struct SeriesView: View {
    
    @State var series = [Serie]()
    
    var body: some View {
        
        VStack {
            if series.count > 0 {
                List(series) { serie in
                    NavigationLink(value: serie) {
                        SerieRowView(serie: serie)
                    }
                }
                
            } else {
                Text("No series")
            }
        }
        .onAppear(perform: {
            print("Task")
            Task {
                do {
                    series = try await fetchSeries()
                } catch {
                    print("Fetch failed: \(error.localizedDescription)")
                }
            }
        })
        .padding(.horizontal, 20)
        .navigationTitle("Series")
        .listStyle(.inset)
        .navigationDestination(for: Serie.self) { serie in
            SerieDetailView(serie: serie)
        }
        
        
        
        
        
    }
}

#Preview {
    SeriesView()
}
