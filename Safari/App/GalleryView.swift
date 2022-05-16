//
//  GalleryView.swift
//  Safari
//
//  Created by Shubham Kumar on 24/01/22.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        ScrollView {
            Text("Gallery")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
