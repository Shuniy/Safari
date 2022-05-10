//
//  InsetFactView.swift
//  Safari
//
//  Created by Shubham Kumar on 24/01/22.
//

import SwiftUI

struct InsetFactView: View {
    //MARK: PROPERTIES
    let animal: Animal
    
    //MARK: BODY
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id:\.self) { item in
                    Text(item)
                }//:ForEach
            }//:TabView
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight:148, idealHeight: 168, maxHeight: 180)
        }//:GroupBox
    }//:Body
}

//MARK: PREVIEW
struct InsetFactView_Previews: PreviewProvider {
    static let animals:[Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactView(animal: animals[4])
            .previewLayout(.sizeThatFits)
    }
}
