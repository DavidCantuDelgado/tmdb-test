//
//  SerieDetailView.swift
//  tmdb-test
//
//  Created by David Cantú Delgado on 22/01/24.
//

import SwiftUI

struct SerieDetailView: View {
    let serie: Serie
        
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                
                Text(serie.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(serie.poster_path ?? "")")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay {
                            VStack {
                                Spacer()
                                HStack {
                                    VoteAverageCircle(voteAverage: serie.vote_average)
                                        .padding(.leading, 20)
                                        .padding(.bottom, -45)
                                    Spacer()
                                    ShareLink(item
                                              : image,
                                              message: (Text(serie.overview)), preview: SharePreview(
                                                serie.name,
                                                image: image
                                            )) {
                                        Image(systemName: "square.and.arrow.up.circle.fill")
                                            .padding([.trailing, .bottom], 20)
                                            .foregroundStyle(.red)
                                            .font(.largeTitle)
                                    }
                                }
                            }
                        }
                } placeholder: {
                    ProgressView()
                }
                .padding(.bottom, 35)
                .padding(.horizontal)
                
                Text(serie.overview)
                    .font(.body)
                    .padding(.horizontal)
            }
            
        }
        .navigationTitle(serie.name)
        
    }
}

#Preview {
    SerieDetailView(serie: Serie(id: 0, name: "Law & Order", overview: "In cases ripped from the headlines, police investigate serious and often deadly crimes, weighing the evidence and questioning the suspects until someone is taken into custody. The district attorney's office then builds a case to convict the perpetrator by proving the person guilty beyond a reasonable doubt. Working together, these expert teams navigate all sides of the complex criminal justice system to make New York a safer place.", first_air_date: "1990-09-13", poster_path: "/m9zTQr4TYS98UFSiA1k0mMfECPe.jpg", vote_average: 7.398))
}
