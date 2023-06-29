//
//  InsetGallery.swift
//  Animals
//
//  Created by Diwakar Reddy  on 17/04/23.
//

import SwiftUI

struct InsetGallery: View {
    // MARK: - Property
    let animal: AnimalModel
    // MARK: - Body
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack(alignment: .center, spacing: 15) {
                ForEach(animal.gallery,id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    .cornerRadius(12)
                }
            } // :- Hstck
        } // :- ScrollView
    }
}
// MARK: - Preview
struct InsetGallery_Previews: PreviewProvider {
    static let animal: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetGallery(animal: animal[0])
    }
}
