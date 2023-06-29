//
//  VideoListView.swift
//  Animals
//
//  Created by Diwakar Reddy  on 14/04/23.
//

import SwiftUI

struct VideoListView: View {
    // MARK: - Property
    @State var videos:[AnimalVideos] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    // MARK: - Body
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { video in
                    NavigationLink(destination: VideoPlayerView(videoSelected: video.id, videotitle: video.name)) {
                        VideoListItem(video: video)
                            .padding(.vertical,8)
                    } // :- NavigationLink
                }// :- Loop
            }// :- List
            .listStyle(InsetListStyle())
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }) {
                        Image(systemName:"arrow.2.squarepath")
                    }
                }
            }
        } // :- NavigationView
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
