//
//  InsetFactView.swift
//  Animals
//
//  Created by Diwakar Reddy  on 17/04/23.
//

import SwiftUI

struct InsetFactView: View {
    // MARK: - Property
    let animal: AnimalModel
    // MARK: - Body
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact,id: \.self) { item in
                    Text(item)
                }
            }// :- Tabview
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148,idealHeight: 168,maxHeight: 180)
        }// :- GroupBox

    }
}
// MARK: - Preview
struct InsetFactView_Previews: PreviewProvider {
    static let animal: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactView(animal: animal[0])
    }
}
