//
//  Constants.swift
//  iTunesArtists_MVVM
//
//  Created by Sai Charan Thummalapudi on 6/17/24.
//

import Foundation
enum urls: String {
    case artistDataUrl = "https://itunes.apple.com/search?term="
}


enum Cautions: String {
    case dataError = "Got error while extracting data"
    case invalid = "Invalid url"
    case invalidServer = "Invalid server data"
    case decodeError = "Unable to convert json object to model "
    case invalidImage = "Invalid Image found"
}

enum TableViewCellId: String {
    case id1 = "ArtistTableViewCell"
}
