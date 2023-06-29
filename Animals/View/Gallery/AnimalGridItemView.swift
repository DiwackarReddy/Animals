//
//  AnimalGridItemView.swift
//  Animals
//
//  Created by Diwakar Reddy  on 18/04/23.
//

import SwiftUI

struct AnimalGridItemView: View {
    // MARK: - Property
    let animal: AnimalModel
    
    // MARK: - Body
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}
// MARK: - Preview
struct AnimalGridItemView_Previews: PreviewProvider {
    static let animal: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalGridItemView(animal: animal[0])
    }
}
