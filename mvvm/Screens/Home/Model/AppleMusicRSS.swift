//
//  Profile.swift
//  mvvm
//
//  Created by Максим Спиридонов on 21.10.2019.
//  Copyright © 2019 Максим Спиридонов. All rights reserved.
//


struct RSSModel: Codable {
    var feed: Feed
}

struct Feed: Codable {
    var title: String
    var results: [AppleSong]
}


struct AppleSong: Codable {
    var id: String
    var name: String
    var artworkUrl100: String
    var url: String
}
