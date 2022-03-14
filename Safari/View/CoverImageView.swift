//
//  CoverImageView.swift
//  Safari
//
//  Created by Shubham Kumar on 24/01/22.
//

import SwiftUI

struct CoverImageView: View {
    //MARK: PROPERTIES
    let coverImages:[CoverImage] = Bundle.main.decode("covers.json")
    
    //MARK: BODY
    var body: some View {
        TabView {
            ForEach(coverImages) {
                item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }//: ForEach
        }//:TabView
        .tabViewStyle(PageTabViewStyle())
    }//: Body
}

//MARK: PREVIEW
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.sizeThatFits)
    }
}
