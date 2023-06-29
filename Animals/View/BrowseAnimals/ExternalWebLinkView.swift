//
//  ExternalWebLinkView.swift
//  Animals
//
//  Created by Diwakar Reddy  on 17/04/23.
//

import SwiftUI

struct ExternalWebLinkView: View {
    // MARK: - Property
    let animal: AnimalModel
    // MARK: - Body
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                } // :- Group
                .foregroundColor(.accentColor)
            }// :- HStack
        } // :- Box
    }
}

struct ExternalWebLinkView_Previews: PreviewProvider {
    static let animal: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWebLinkView(animal: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
