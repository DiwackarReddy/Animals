//
//  InsetMapview.swift
//  Animals
//
//  Created by Diwakar Reddy  on 17/04/23.
//

import SwiftUI
import MapKit

struct InsetMapview: View {
    // MARK: - Property
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    // MARK: - Body
    
    var body: some View {
        Map(coordinateRegion: $region)
            .overlay(
                NavigationLink {
                    MapView()
                } label: {
                    HStack {
                     Image(systemName: "mappin.circle")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    }// :- Hstack
                    .padding(.vertical,10)
                    .padding(.horizontal,14)
                    .background {
                        Color.black.opacity(0.4)
                            .cornerRadius(8)
                    }
                }// :- Navigation               
            .padding(12),alignment: .topTrailing)
            .frame(height: 256)
            .cornerRadius(12)
        
    }
}

struct InsetMapview_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapview()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
