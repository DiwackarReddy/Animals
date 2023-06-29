//
//  ContentView.swift
//  Animals
//
//  Created by Diwakar Reddy  on 14/04/23.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Property
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolBarIcon: String = "square.grid.2x2"
    
    // MARK: - Function
    func gridSwitch(){
        gridLayout = Array(repeating: GridItem(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("GridNumber: \(gridColumn)")
        
        // MARK: - ToolBarImage
        switch gridColumn {
        case 1:
            toolBarIcon = "square.grid.2x2"
        case 2:
            toolBarIcon = "square.grid.3x2"
        case 3:
            toolBarIcon = "rectangle.grid.1x2"
        default:
            toolBarIcon = "square.grid.2x2"
        }
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetaliView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }// :- NavigationLink
                        } // :- Loop
                        CreditsView()
                            .modifier(CenterModifier())
                    }// :- List
                } else {
                    ScrollView(.vertical,showsIndicators: false) {
                        LazyVGrid(columns: gridLayout,alignment: .center,spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetaliView(animal: animal)) {
                                   AnimalGridItemView(animal: animal)
                                } // :- NavigationLink
                            } // :- Loop
                        } // :- Grid
                        .padding(10)
                        .animation(.easeIn)
                    } // :- scrollView
                } // :- Condition
            } // :- Group
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button(action: {
                            isGridViewActive = false
                            hapticImpact.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        // GridButon
                        Button(action: {
                            gridSwitch()
                            isGridViewActive = true
                            hapticImpact.impactOccurred()
                        }) {
                            Image(systemName: toolBarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    } // :- HStack
                }
            }) // :- ToolBar
            .navigationTitle("Animals")
            .navigationBarTitleDisplayMode(.large)
        }// :- Navigation
    }
}
// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
