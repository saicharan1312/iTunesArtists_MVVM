//
//  Models.swift
//  iTunesArtists_MVVM
//
//  Created by Sai Charan Thummalapudi on 6/17/24.
//

import Foundation

struct Artists: Codable {
    let artistName: String?
    let country: String?
    let primaryGenreName: String?
    let collectionPrice: Float
    let artworkUrl60: String?
    
    enum CodingKeys : String, CodingKey {
        case artistName 
        case country
        case primaryGenreName
        case collectionPrice
        case artworkUrl60
    }
}

struct ArtistsInfo: Codable {
    let resultCount: Int?
    let results:[Artists]?
}

