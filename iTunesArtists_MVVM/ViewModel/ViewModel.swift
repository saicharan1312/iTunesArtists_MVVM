//
//  ViewModel.swift
//  iTunesArtists_MVVM
//
//  Created by Sai Charan Thummalapudi on 6/17/24.
//

import Foundation

class ArtistViewModel {
    var artistData: [Artists] = []
    
    func fetchDataMock(url: String, completion: @escaping () -> ()) {
        MockAPIManager.mockObj.fetchDataFromAPI(url: url) { data, error in
            if let artistArr = data?.results {
                self.artistData = artistArr
                completion()
            }
        }
    }
    
    func fetchData(url: String, completion: @escaping () -> ()) {
       APIManager.sharedInstance.fetchDataFromAPI(url: url) { data, error in
        
            if let artistArr = data?.results {
                self.artistData = artistArr
                print(self.artistData.count)
                completion()
            }
        }
}
}
