//
//  VideoModel.swift
//  Animals
//
//  Created by Diwakar Reddy  on 17/04/23.
//

import Foundation
struct AnimalVideos: Identifiable , Codable {
    let id: String
    let name: String
    let headline: String
    
    // coumpted Property
    var thumbnail: String {
        return "video-\(id)"
    }
}
