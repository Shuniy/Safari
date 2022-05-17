//
//  CenterModifier.swift
//  Safari
//
//  Created by Shubham Kumar on 17/05/22.
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
