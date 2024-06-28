//
//  ArtistViewController.swift
//  iTunesArtists_MVVM
//
//  Created by Sai Charan Thummalapudi on 6/17/24.


import UIKit
import MBProgressHUD

class ArtistViewController: UIViewController {

    @IBOutlet weak var networkSlider: UISegmentedControl!
    @IBOutlet weak var searchArtist: UISearchBar!
    @IBOutlet weak var artistTableView: UITableView!
    var hud: MBProgressHUD!
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
        DispatchQueue.main.async {
            self.hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        }
        if networkSlider.selectedSegmentIndex == 0 {
        let searchDataUrl = updatedUrl(urls.artistDataUrl.rawValue, searchBarText)
        artistViewModelObj.fetchData(url: searchDataUrl) {
            DispatchQueue.main.async {
                self.artistTableView.reloadData()
                self.hud.hide(animated: true)
            }
        }
    }
        else {
            let searchDataUrl = updatedUrl(urls.artistDataUrl.rawValue, searchBarText)
            artistViewModelObj.fetchDataMock(url: searchDataUrl) {
                DispatchQueue.main.async {
                    self.artistTableView.reloadData()
                    self.hud.hide(animated: true)
                }
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
            dataFetch(searchBarText: searchText.lowercased())
        }
        else {
            dataFetch(searchBarText: "")
        }
        artistTableView.reloadData()
    }
}



