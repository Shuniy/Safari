//
//  VideoPlayerHelper.swift
//  Safari
//
//  Created by Shubham Kumar on 10/05/22.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(filename: String, fileFormat: String) -> AVPlayer {
    if let url = Bundle.main.url(forResource: filename, withExtension: fileFormat) {
        videoPlayer = AVPlayer(url: url)
        videoPlayer?.play()
    }
    return videoPlayer!
}
