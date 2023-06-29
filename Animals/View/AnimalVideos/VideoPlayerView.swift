//
//  VideoPlayerView.swift
//  Animals
//
//  Created by Diwakar Reddy  on 17/04/23.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    // MARK: - Property
    var videoSelected: String
    var videotitle: String
    // MARK: - Body
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileForamt: "mp4")) {
             //   Text(videotitle)
            }
            .overlay (
               Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32,height: 32)
                    .padding(.top,6)
                    .padding(.horizontal,8)
                    ,alignment: .topLeading
            )
        } // :- VStack
        .accentColor(.accentColor)
        .navigationTitle(videotitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}
// MARK: - Preview
struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videotitle: "Lion")
        }
    }
}
