//
//  MotionAnimationView.swift
//  Animals
//
//  Created by Diwakar Reddy  on 18/04/23.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - Property
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false
    // MARK: - Functions
    
    // 1. RANDOM COORDINATE
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    // 2. RANDOM SIZE
    func randomsize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    // 3. RANDOM SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    // 4. RANDOM SPEED
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    // 5. RANDOM DELAY
    
    // MARK: - Body
  
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle,id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomsize(),height: randomsize(),alignment: .center)
                        .position(x: randomCoordinate(max: geometry.size.width),y: randomCoordinate(max: geometry.size.height))
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        )
                        .onAppear {
                            isAnimating = true
                        }
                } // :- Loop
            } // :- Zstack
            .drawingGroup()
        } // :- GeometryReader
    }
}
// MARK: - Preview
struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
