//
//  ContentView.swift
//  Safari
//
//  Created by Shubham Kumar on 24/01/22.
//

import SwiftUI

struct ContentView: View {
    //MARK: PROPERTIES
    let animals:[Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var gridLayout = [GridItem(.flexible())]
    @State private var isGridViewActive: Bool = false
    @State private var gridColumn = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    func gridSwitch() {
        gridLayout = Array.init(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        switch gridColumn {
        case 1:
            toolbarIcon = "rectangle.grid.1x2"
        case 2:
            toolbarIcon = "square.grid.2x2"
        case 3:
            toolbarIcon = "square.grid.3x3"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    //MARK: BODY
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height:300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) {
                            animal in
                            NavigationLink(destination:AnimalDetailView(animal: animal)){
                                AnimalListItemView(animal: animal)
                            }//:Navigation Link
                        }//:ForEach
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        Text("\(gridColumn)")
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }
                        .padding(10)
                        .animation(.easeIn, value: gridColumn)
                    }
                }//:List
            }
            .navigationTitle(Text("Africa"))
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button {
                            print("List View is Activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        Button {
                            print("Grid View is Activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }
                }
            }
        }//:Navigation View
    }//: Body
}

//MARK: PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
