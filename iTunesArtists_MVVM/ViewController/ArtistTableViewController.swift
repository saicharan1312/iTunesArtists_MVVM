//
//  ArtistTableViewController.swift
//  iTunesArtists_MVVM
//
//  Created by Sai Charan Thummalapudi on 6/17/24.
//

import UIKit

//MARK: TableView extension
extension ArtistViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(artistViewModelObj.artistData.count)
        return artistViewModelObj.artistData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = artistTableView.dequeueReusableCell(withIdentifier: TableViewCellId.id1.rawValue, for: indexPath) as! ArtistTableViewCell
        if indexPath.row < artistViewModelObj.artistData.count {
            let info = artistViewModelObj.artistData[indexPath.row]
            cell.setData(dataInput: info)
            return cell
        }
        return UITableViewCell()
    }
}

