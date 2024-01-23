//
//  MovieDetailView.swift
//  tmdb-test
//
//  Created by David Cantú Delgado on 19/01/24.
//

import SwiftUI

struct MovieDetailView: View {

    let movie: Movie
        
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                Text(movie.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.poster_path ?? "")")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay {
                            VStack {
                                Spacer()
                                HStack {
                                    VoteAverageCircle(voteAverage: movie.vote_average)
                                        .padding(.leading, 20)
                                        .padding(.bottom, -45)
                                    Spacer()
                                    ShareLink(item
                                              : image,
                                              message: (Text(movie.overview)), preview: SharePreview(
                                                movie.title,
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
                
                Text(movie.overview)
                    .font(.body)
                    .padding(.horizontal)
            }
        }
        
    }
}

#Preview {
    MovieDetailView(movie: Movie(id: 0, title: "Aquaman a the lost kingdom", overview: "Black Manta, still driven by the need to avenge his father's death and wielding the power of the mythic Black Trident, will stop at nothing to take Aquaman down once and for all. To defeat him, Aquaman must turn to his imprisoned brother Orm, the former King of Atlantis, to forge an unlikely alliance in order to save the world from irreversible destruction.", release_date: "2023/12/23", poster_path: "/qJiWKzdRScI5OcRQqOu3qdMZKXY.jpg", vote_average: 9.0))
}
