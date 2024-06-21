//
//  MockAPIManager.swift
//  iTunesArtists_MVVM
//
//  Created by Sai Charan Thummalapudi on 6/21/24.
//

import Foundation
class MockAPIManager : APIManager {
    override func fetchDataFromAPI(url: String, completion: @escaping ((ArtistsInfo?,Error?)->())) {
        let mockArtistObj1 = Artists(artistName: "Arijit", country: "India", primaryGenreName: "Romantic/Classical", collectionPrice: 19.99, artworkUrl60: "Nothing")
        let mockArtistInfo = ArtistsInfo(resultCount: 1, results: [mockArtistObj1])
        completion(mockArtistInfo, nil)
    }
}
