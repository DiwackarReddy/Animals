//
//  VideoPlayerHelper.swift
//  Animals
//
//  Created by Diwakar Reddy  on 17/04/23.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName:String,fileForamt: String) -> AVPlayer {
    if Bundle.main.url(forResource: fileName, withExtension: fileForamt) != nil {
        videoPlayer = AVPlayer(url: Bundle.main.url(forResource: fileName, withExtension: fileForamt)!)
        videoPlayer?.play()
    }
    return videoPlayer!
}
