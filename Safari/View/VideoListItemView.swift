//
//  VideoListItem.swift
//  Safari
//
//  Created by Shubham Kumar on 10/05/22.
//

import SwiftUI

struct VideoListItemView: View {
    //MARK: PROPERTIES
    let video: Video
    //MARK: BODY
    var body: some View {
        HStack(spacing: 10) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 80)
                    .cornerRadius(10)
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 32)
                    .shadow(radius: 5)
            }
            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }
    }
}

//MARK: PREVIEW
struct VideoListItemView_Previews: PreviewProvider {
    static let videos: [Video] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideoListItemView(video: videos[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
