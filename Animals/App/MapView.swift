//
//  MapView.swift
//  Animals
//
//  Created by Diwakar Reddy  on 14/04/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - Property
    @State private var region: MKCoordinateRegion = {
        var mapCpprdinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapzoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCpprdinates, span: mapzoomLevel)
        return mapRegion
    }()
    let locations: [ParksLocation] = Bundle.main.decode("locations.json")
    // MARK: - Body
    var body: some View {
        Map(coordinateRegion: $region,annotationItems: locations) { items in
            MapAnnotation(coordinate: items.location) {
                MapAnnotationView(location: items)
                //                Image("logo")
                //                    .resizable()
                //                    .scaledToFit()
                //                    .frame(width: 32,height: 32,alignment: .center)
            }
        }// :- MAP
        .overlay(
            HStack(alignment: .center,spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48,height: 48)
                VStack(alignment: .leading,spacing: 3) {
                    HStack {
                        Text("latitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    } // Hstack
                    Divider()
                    HStack {
                        Text("longitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    } // Hstack

                } // :- Vstack

            } // :- HStack
                .padding(.vertical,12)
                .padding(.horizontal,16)
                .background(content: {
                    Color.black
                        .cornerRadius(8)
                        .opacity(0.6)
                })
                .padding()
            ,alignment: .top
        )
    }
}
// MARK: - Preview
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
