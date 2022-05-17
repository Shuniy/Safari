//
//  CreditsView.swift
//  Safari
//
//  Created by Shubham Kumar on 17/05/22.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 128, alignment: .center)
            
            Text(
                """
Copyright Shubham Kumar
Alrights Not Reserved.
""")
            .multilineTextAlignment(.center)
            .font(.footnote)
        }
        .padding()
        .opacity(0.5)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
