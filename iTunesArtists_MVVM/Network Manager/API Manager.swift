//
//  API Manager.swift
//  iTunesArtists_MVVM
//
//  Created by Sai Charan Thummalapudi on 6/17/24.
//

import Foundation

class APIManager {
    static let sharedInstance = APIManager()
    
    func fetchDataFromAPI( url: String, completion: @escaping ((ArtistsInfo?,Error?)->())) {
        guard let newUrl = URL(string: url) else {
            print(Cautions.invalid.rawValue)
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: newUrl)) { data, response, error in
            if let error = error {
                completion(nil,error)
                return
            }
            
            guard let data = data else {
                completion(nil,error)
                return
            }
            
            do {
                let decodedData = try self.decodeData(data: data)
                completion(decodedData,nil)
            } catch {
                completion(nil,error)
            }
        }.resume()
    }
    //MARK: Decoding Data
    func decodeData(data: Data) throws -> ArtistsInfo {
        do {
            let decodedJsonData = try JSONDecoder().decode(ArtistsInfo.self, from: data)
            return decodedJsonData
        } catch {
            print("decode error")
            throw error
        }
    }
    //MARK: Image data
    func getImageData(url: String, closure: @escaping (Data?) -> ()) {
        if let imageUrl = URL(string: url) {
            URLSession.shared.dataTask(with: URLRequest(url: imageUrl)) { data, _, _ in
                if let imageData = data {
                    closure(imageData)
                }
            }.resume()
        }
    }
}
