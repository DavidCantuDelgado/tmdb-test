//
//  VoteAverageCircle.swift
//  tmdb-test
//
//  Created by David Cantú Delgado on 22/01/24.
//

import SwiftUI

struct VoteAverageCircle: View {
    let voteAverage: Double
        
        var body: some View {
            ZStack {
                Circle()
                    .fill(Color.black)
                    .frame(width: 70, height: 70)
                Circle()
                    .stroke(Color.gray.opacity(0.6), lineWidth:6)
                    .rotationEffect(.degrees(-90))
                    .frame(width: 60, height: 60)
                Circle()
                    .trim(from: 0.0, to: CGFloat(voteAverage / 10))
                    .stroke(lineColor(voteAverage: voteAverage), style: StrokeStyle(lineWidth: 6, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .frame(width: 60, height: 60)
                Text(String(format: "%.1f", voteAverage))
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
            }
            
        }
    
    func lineColor(voteAverage: Double) -> Color {
        if voteAverage > 8.5 {
            return Color.green
        } else {
            if voteAverage <= 8.5 && voteAverage > 7 {
                return Color.yellow
            } else {
                return Color.red
            }
        }
    }
}

#Preview {
    VoteAverageCircle(voteAverage: 7.5)
}
