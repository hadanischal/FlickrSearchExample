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
    var viewModel: DetailsViewModel?
    weak var dataSource: DetailsDataSource<DetailModel>?

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
         self.photoData = photosModel
        self.viewModel?.fetchDataSource(photoData: photoData) { (result) in
            switch result {
            case .failure :
                XCTAssert(false, "ViewModel should not be able to fetch without viewModel nil")
            default: break
            }
        }
    }

    func testfetchDetailsNoPhotoss() {
        self.photoData = nil
        self.viewModel?.fetchDataSource(photoData: photoData) { (result) in
            switch result {
            case .failure :
                XCTAssert(false, "ViewModel should not be able to fetch")
            default: break
            }
        }
    }

}
private let photosModel = PhotosModel(id: "41886638322", owner: "151109375", secret: "9e692e7e1d", server: "959", farm: 1, title: "Alice and Bob", ispublic: 1, isfriend: 0, isfamily: 0)
