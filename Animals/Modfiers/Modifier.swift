//
//  Modifier.swift
//  Animals
//
//  Created by Diwakar Reddy  on 18/04/23.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
