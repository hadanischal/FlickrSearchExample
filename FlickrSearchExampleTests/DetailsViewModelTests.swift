//
//  DetailsViewModelTests.swift
//  FlickrSearchExampleTests
//
//  Created by Nischal Hada on 6/24/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import XCTest
@testable import FlickrSearchExample

class DetailsViewModelTests: XCTestCase {
    var photoData: PhotosModel?
    var viewModel : DetailsViewModel!
    weak var dataSource : DetailsDataSource<DetailModel>?
    
    override func setUp() {
        super.setUp()
        self.dataSource = DetailsDataSource<DetailModel>()
        self.viewModel = DetailsViewModel(dataSource: dataSource)
    }
    
    override func tearDown() {
        self.viewModel = nil
        self.dataSource = nil
        super.tearDown()
    }
    
    func testfetchDetails() {
         self.photoData = PhotosModel.init(id:"42246828484" , owner: "32889236@N02", secret: "888ac97f4a", server: "1772", farm: 2, title: "Different angle", ispublic: true, isfriend: false, isfamily: false)
        self.viewModel.fetchDataSource(photoData: photoData) { (result) in
            switch result {
            case .failure(_) :
                XCTAssert(false, "ViewModel should not be able to fetch without viewModel nil")
            default: break
            }
        }
    }
    
    func testfetchDetailsNoPhotoss() {
        self.photoData = nil
        self.viewModel.fetchDataSource(photoData: photoData) { (result) in
            switch result {
            case .failure(_) :
                XCTAssert(false, "ViewModel should not be able to fetch")
            default: break
            }
        }
    }

    
}
