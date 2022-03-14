//
//  HeadingView.swift
//  Safari
//
//  Created by Shubham Kumar on 24/01/22.
//

import SwiftUI

struct HeadingView: View {
    //MARK: PROPERTIES
    var headingImage:String
    var headingText:String
    
    //MARK: BODY
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .fontWeight(.bold)
                .font(.title)
        }//:HStack
        .padding(.vertical)
    }//:Body
}

//MARK: PREVIEW
struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
            .previewLayout(.sizeThatFits)
    }
}
