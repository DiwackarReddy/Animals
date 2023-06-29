//
//  CoverImageView.swift
//  Animals
//
//  Created by Diwakar Reddy  on 14/04/23.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - Property
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    // MARK: - Body
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                     .resizable()
                 .scaledToFill()
            } // :- FOREACH
        } // :- TABVIEW
        .tabViewStyle(PageTabViewStyle())
    }
}
// MARK: - Preview
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
