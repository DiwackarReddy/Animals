//
//  AnimalDataModel.swift
//  Animals
//
//  Created by Diwakar Reddy  on 17/04/23.
//

import Foundation

struct AnimalModel: Codable,Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
