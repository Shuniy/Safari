//
//  VideoListView.swift
//  Safari
//
//  Created by Shubham Kumar on 24/01/22.
//

import SwiftUI

struct VideoListView: View {
    @State var videos: [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { video in
                    VideoListItemView(video: video)
                        .padding(9)
                }
            }//:List
            .listStyle(.insetGrouped)
            .navigationTitle("Videos")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }

                }
            }
        }//:NavigationView
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
