//
//  LocationModel.swift
//  Animals
//
//  Created by Diwakar Reddy  on 17/04/23.
//

import Foundation
import MapKit

struct ParksLocation: Identifiable, Codable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    // ComputedProperty
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
