//
//  VideoListItem.swift
//  Animals
//
//  Created by Diwakar Reddy  on 17/04/23.
//

import SwiftUI

struct VideoListItem: View {
    // MARK: - Property
    let video: AnimalVideos
    // MARK: - Body
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                .cornerRadius(9)
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 24)
                    .shadow(radius: 4)
            } // :- ZStack
            VStack(alignment: .leading,spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            } // :- VStack
        } // :- HStack
    }
}

struct VideoListItem_Previews: PreviewProvider {
    static let videos: [AnimalVideos] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideoListItem(video: videos[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
