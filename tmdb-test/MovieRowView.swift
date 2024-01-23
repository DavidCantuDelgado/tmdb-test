//
//  MovieRowView.swift
//  tmdb-test
//
//  Created by David Cantú Delgado on 22/01/24.
//

import SwiftUI

struct MovieRowView: View {
    
    
    let movie: Movie
    var size = UIScreen.main.bounds
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(movie.title)
                .font(.headline)
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "")")) { image in
                image
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .scaledToFit()
                    .frame(width: size.width * 0.75)
                    .overlay {
                        VStack {
                            Spacer()
                            HStack {
                                VoteAverageCircle(voteAverage: movie.vote_average)
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
            
            Text(movie.overview)
                .font(.subheadline)
        }
        
        
    }
}

#Preview {
    MovieRowView(movie: Movie(id: 0, title: "Aquaman a the lost kingdom", overview: "Black Manta, still driven by the need to avenge his father's death and wielding the power of the mythic Black Trident, will stop at nothing to take Aquaman down once and for all. To defeat him, Aquaman must turn to his imprisoned brother Orm, the former King of Atlantis, to forge an unlikely alliance in order to save the world from irreversible destruction.", release_date: "2023/12/23", poster_path: "/qJiWKzdRScI5OcRQqOu3qdMZKXY.jpg", vote_average: 9.0))
}
