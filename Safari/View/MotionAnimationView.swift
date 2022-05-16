//
//  MotionAnimationView.swift
//  Safari
//
//  Created by Shubham Kumar on 16/05/22.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false
    
    // Random Circle
    func randomCircle(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    // Random Size
    func randomSize(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    // Random Scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 1.0...2.0))
    }
    // Random Speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1)
    }
    // Random Delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.5)
                        .frame(maxHeight: randomSize(max: 300), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(x: randomCircle(max: geometry.size.width), y: randomCircle(max: geometry.size.height))
                        .animation(Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5).repeatForever().speed(randomSpeed()).delay(randomDelay()), value: isAnimating)
                }
            }
        }
        .onAppear {
            isAnimating = true
        }
        .drawingGroup()
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
