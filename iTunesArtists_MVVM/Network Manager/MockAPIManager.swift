//
//  MockAPIManager.swift
//  iTunesArtists_MVVM
//
//  Created by Sai Charan Thummalapudi on 6/21/24.
//

import Foundation
class MockAPIManager : APIManager {
    
    static let mockObj = MockAPIManager()
    
    override func fetchDataFromAPI(url: String, completion: @escaping ((ArtistsInfo?,Error?)->())) {
        let mockArtistObj1 = Artists(artistName: "Arijit", country: "India", primaryGenreName: "Romantic/Classical", collectionPrice: 19.99, artworkUrl60: "Nothing")
        let mockArtistObj2 = Artists(artistName: "Anirudh", country: "India", primaryGenreName: "Pop", collectionPrice: 19.99, artworkUrl60: "Nothing")
        let mockArtistObj3 = Artists(artistName: "Thaman", country: "India", primaryGenreName: "Rock", collectionPrice: 9.99, artworkUrl60: "Nothing")
        let mockArtistObj4 = Artists(artistName: "Rahul", country: "India", primaryGenreName: "Hiphop", collectionPrice: 1.99, artworkUrl60: "Nothing")
        let mockArtistObj5 = Artists(artistName: "Shreya", country: "India", primaryGenreName: "classical", collectionPrice: 0.00, artworkUrl60: "Nothing")
        let mockArtistObj6 = Artists(artistName: "Rahman", country: "India", primaryGenreName: "Romantic/Classical", collectionPrice: 0.99, artworkUrl60: "Nothing")
        let mockArtistObj7 = Artists(artistName: "MM.Keeravani", country: "India", primaryGenreName: "BGM", collectionPrice: 2.99, artworkUrl60: "Nothing")
        let mockArtistObj8 = Artists(artistName: "Sai", country: "India", primaryGenreName: "Top", collectionPrice: 7.99, artworkUrl60: "Nothing")
        let mockArtistObj9 = Artists(artistName: "Charan", country: "India", primaryGenreName: "Adventure", collectionPrice: 8.99, artworkUrl60: "Nothing")
        let mockArtistObj10 = Artists(artistName: "Mahesh", country: "India", primaryGenreName: "Horror", collectionPrice: 9.79, artworkUrl60: "Nothing")
        let mockArtistInfo = ArtistsInfo(resultCount: 10, results: [mockArtistObj1, mockArtistObj2, mockArtistObj3, mockArtistObj4 , mockArtistObj5, mockArtistObj6, mockArtistObj7, mockArtistObj8, mockArtistObj9, mockArtistObj10])
        completion(mockArtistInfo, nil)
    }
}
