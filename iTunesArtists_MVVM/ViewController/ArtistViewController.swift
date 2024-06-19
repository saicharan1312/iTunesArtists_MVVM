//
//  ArtistViewController.swift
//  iTunesArtists_MVVM
//
//  Created by Sai Charan Thummalapudi on 6/17/24.


import UIKit

class ArtistViewController: UIViewController {

    @IBOutlet weak var searchArtist: UISearchBar!
    @IBOutlet weak var artistTableView: UITableView!
    var artistViewModelObj = ArtistViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchArtist.delegate = self
        tableInit()
        
    }
    func tableInit() {
        artistTableView.dataSource = self
    }
}

//MARK: - Network Call
extension ArtistViewController {
    func dataFetch(searchBarText: String) {
        let searchDataUrl = updatedUrl(urls.artistDataUrl.rawValue, searchBarText)
        artistViewModelObj.fetchData(url: searchDataUrl) {
            DispatchQueue.main.async {
                self.artistTableView.reloadData()
                
            }
        }
    }
    func updatedUrl(_ url: String,_ text: String)->String {
        return url+text
    }
}

extension ArtistViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty  {
            dataFetch(searchBarText: searchText)
        }
        else {
            artistTableView.reloadData()
            dataFetch(searchBarText: "")
        }
    }
}



