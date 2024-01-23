//
//  SerieRowView.swift
//  tmdb-test
//
//  Created by David Cantú Delgado on 22/01/24.
//

import SwiftUI

struct SerieRowView: View {
    let serie: Serie
    var size = UIScreen.main.bounds
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(serie.name)
                .font(.headline)
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(serie.poster_path ?? "")")) { image in
                image
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .scaledToFit()
                    .frame(width: size.width * 0.75)
                    .overlay {
                        VStack {
                            Spacer()
                            HStack {
                                VoteAverageCircle(voteAverage: serie.vote_average)
                                    .padding(.leading, 20)
                                    .padding(.bottom, -35)
                                Spacer()
                            }
                        }
                    }
                    .padding(.bottom, 35)
            } placeholder: {
                ProgressView()
            }
            
            Text(serie.overview)
                .font(.subheadline)
        }
        
        
    }
}

#Preview {
    SerieRowView(serie: Serie(id: 0, name: "Law & Order", overview: "In cases ripped from the headlines, police investigate serious and often deadly crimes, weighing the evidence and questioning the suspects until someone is taken into custody. The district attorney's office then builds a case to convict the perpetrator by proving the person guilty beyond a reasonable doubt. Working together, these expert teams navigate all sides of the complex criminal justice system to make New York a safer place.", first_air_date: "1990-09-13", poster_path: "/m9zTQr4TYS98UFSiA1k0mMfECPe.jpg", vote_average: 7.398))
}
