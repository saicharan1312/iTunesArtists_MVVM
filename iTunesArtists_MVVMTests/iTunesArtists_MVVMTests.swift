//
//  iTunesArtists_MVVMTests.swift
//  iTunesArtists_MVVMTests
//
//  Created by Sai Charan Thummalapudi on 6/17/24.
//

import XCTest
@testable import iTunesArtists_MVVM

class iTunesArtists_MVVMTests: XCTestCase {
    var artistObj: ArtistViewController?
    var viewModelObj: ArtistViewModel?
    override func setUpWithError() throws {
        artistObj = ArtistViewController()
        viewModelObj = ArtistViewModel()
    }

    override func tearDownWithError() throws {
        artistObj = nil
        viewModelObj = nil
    }

    func testUpdatedURL() throws {
        XCTAssertNotNil(artistObj)
        let result1 = artistObj?.updatedUrl("a", "b")
        print(result1 ?? "No value")
        XCTAssertEqual(result1, "ab")
        
        XCTAssertNotNil(artistObj)
        let result2 = artistObj?.updatedUrl("", "b")
        print(result2 ?? "No value")
        XCTAssertEqual(result2, "b")
        
        XCTAssertNotNil(artistObj)
        let result3 = artistObj?.updatedUrl("", "")
        print(result3 ?? "No value")
        XCTAssertEqual(result3, "")
        
        XCTAssertNotNil(artistObj)
        let result4 = artistObj?.updatedUrl("-", "")
        print(result4 ?? "No value")
        XCTAssertEqual(result4, "-")
    }
    
    func testFetchData() throws {
        XCTAssertNotNil(viewModelObj)
        var a: String = ""
        var b: Int = 0
        APIManager.sharedInstance.fetchDataFromAPI(url: "Nothing") { data, error in
            if error != nil {
                a = "Error"
            }
            XCTAssertEqual(a, "Error")
        }
        APIManager.sharedInstance.fetchDataFromAPI(url: "") { data, error in
            if error != nil {
                a = "Error"
            }
            XCTAssertEqual(a, "Error")
        }
        APIManager.sharedInstance.fetchDataFromAPI(url: urls.artistDataUrl.rawValue+"a") { data, error in
            if error != nil {
                a = "Error"
            }
            if let serverData = data {
                b = serverData.resultCount
                print(b)
            }
            XCTAssertEqual(a, "")
            XCTAssertEqual(b, 50)
        }
        APIManager.sharedInstance.fetchDataFromAPI(url: urls.artistDataUrl.rawValue+"") { data, error in
            if error != nil {
                a = "Error"
            }
            if let serverData = data {
                b = serverData.resultCount
                print(b)
            }
            XCTAssertEqual(a, "")
            XCTAssertEqual(b, 0)
        }
    }
    
}
