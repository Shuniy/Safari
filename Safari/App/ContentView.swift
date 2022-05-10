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
    
    //MARK: BODY
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(height:300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
//                LazyVStack {
                    ForEach(animals) {
                        animal in
                        NavigationLink(destination:AnimalDetailView(animal: animal)){
                            AnimalListItemView(animal: animal)
                        }//:Navigation Link
                    }//:ForEach
//                }//:LazyVStack
            }//:VStack
            .navigationTitle(Text("Africa"))
        }//:Navigation View
    }//: Body
}

//MARK: PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
