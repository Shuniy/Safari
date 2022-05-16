//
//  GalleryView.swift
//  Safari
//
//  Created by Shubham Kumar on 24/01/22.
//

import SwiftUI

struct GalleryView: View {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    @State var selectedAnimal: String = "lion"
    @State private var gridLayout = [GridItem(.flexible())]
    @State private var gridColumn = 3.0
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    func gridSwitch() {
        gridLayout = Array.init(repeating: GridItem(.flexible()), count: Int(gridColumn))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 9))
                
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn) { newValue in
                        gridSwitch()
                    }
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals, id: \.id) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = animal.image.lowercased()
                            }
                    }
                }
                .animation(.easeIn, value: gridColumn)
                .onAppear {
                    gridSwitch()
                    haptics.impactOccurred()
                }
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
