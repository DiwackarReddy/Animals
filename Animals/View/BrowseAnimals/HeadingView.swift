//
//  HeadingView.swift
//  Animals
//
//  Created by Diwakar Reddy  on 17/04/23.
//

import SwiftUI

struct HeadingView: View {
    // MARK: - Property
    var headingImage: String
    var headingText: String
    // MARK: - Body
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }// :- Hstack
        .padding(.vertical)
    }
}
struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
