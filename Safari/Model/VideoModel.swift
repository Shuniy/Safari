//
//  VideoModel.swift
//  Safari
//
//  Created by Shubham Kumar on 10/05/22.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    var thumbnail: String {
        "video-\(id)"
    }
}
