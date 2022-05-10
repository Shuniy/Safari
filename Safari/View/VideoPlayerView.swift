//
//  VideoPlayerView.swift
//  Safari
//
//  Created by Shubham Kumar on 10/05/22.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    var videoSelected: String
    var videoTitle: String
    var fileFormat: String = "mp4"
    
    var body: some View {
        VStack {
            VideoPlayer(player: playVideo(filename: videoSelected, fileFormat: fileFormat)) {
            }
            .overlay(alignment: .topLeading) {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 32, alignment: .center)
                    .padding(8)
            }
        }//:VStack
        .tint(.accentColor)
        .navigationTitle(videoTitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "cheetah", videoTitle: "Cheetah")
        }
    }
}
