//
//  CreditsView.swift
//  Animals
//
//  Created by Diwakar Reddy  on 18/04/23.
//

import SwiftUI

struct CreditsView: View {
    // MARK: - Property
    
    // MARK: - Body
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128,height: 128)
            Text("""
                 copyright © All Rights Reserved
                 """)
            .font(.footnote)
        .multilineTextAlignment(.center)
        } // :- VStack
        .padding()
        .opacity(0.4)

    }
}
    // MARK: - Preview
    struct CreditsView_Previews: PreviewProvider {
        static var previews: some View {
            CreditsView()
        }
    }
