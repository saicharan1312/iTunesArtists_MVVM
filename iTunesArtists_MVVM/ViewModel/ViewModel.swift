//
//  ViewModel.swift
//  iTunesArtists_MVVM
//
//  Created by Sai Charan Thummalapudi on 6/17/24.
//

import Foundation

class ArtistViewModel {
    
    var apiManagerObj = MockAPIManager()
    var artistData: [Artists] = []
    
    func fetchData(url: String, completion: @escaping () -> ()) {
//       APIManager.sharedInstance.fetchDataFromAPI(url: url) { data, error in
        apiManagerObj.fetchDataFromAPI(url: url) { data, error in
            if let artistArr = data?.results {
                self.artistData = artistArr
                completion()
            }
        }
    }
}
