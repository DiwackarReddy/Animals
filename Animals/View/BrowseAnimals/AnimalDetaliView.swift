//
//  AnimalDetaliView.swift
//  Animals
//
//  Created by Diwakar Reddy  on 17/04/23.
//

import SwiftUI

struct AnimalDetaliView: View {
    // MARK: - Property
    let animal: AnimalModel
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            VStack(alignment: .center,spacing: 20) {
                // AnimalImage
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                // Title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical,8)
                    .foregroundColor(.primary)
                    .background {
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y:24)
                    }
                // HeadLine
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                // Gallery
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    InsetGallery(animal: animal)
                }// :- Group
                
                // Facts
                Group {
                 HeadingView(headingImage: "questionmark.circle", headingText: "Did you know")
                    InsetFactView(animal: animal)
                }// :- Group
                .padding(.horizontal)
                
                // Discrption
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                    
                } // :- Group
                .padding(.horizontal)

                // Map
                Group {
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    InsetMapview()
                } // :- Group
                .padding(.horizontal)
                
                // Link
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    ExternalWebLinkView(animal: animal)
                }// :- GROUP
                .padding(.horizontal)

            } // :- VSTACK
            .navigationTitle("Learn About \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)
        } // :- ScrollView
    }
}
// MARK: - Preview
struct AnimalDetaliView_Previews: PreviewProvider {
    static let animal: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView {
            AnimalDetaliView(animal: animal[0])
        }
    }
}
