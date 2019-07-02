//
//  PhotosViewModelTests.swift
//  FlickrSearchExampleTests
//
//  Created by Nischal Hada on 6/24/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import XCTest
@testable import FlickrSearchExample

class PhotosViewModelTests: XCTestCase {
    fileprivate class MockPhotosServiceCall: PhotosServiceCallProtocol {
        var searchData: SearchResultsModel?
        func fetchPhotos(_ searchTerm: String, completion: @escaping ((Result<SearchResultsModel, ErrorResult>) -> Void)) {
            if let data = searchData {
                completion(Result.success(data))
            } else {
                completion(Result.failure(ErrorResult.custom(string: "No converter")))
            }
        }
    }

    var viewModel: PhotosViewModel?
    var dataSource: GenericDataSource<PhotosModel>?
    fileprivate var service: MockPhotosServiceCall?

    override func setUp() {
        super.setUp()
        self.service = MockPhotosServiceCall()
        self.dataSource = GenericDataSource<PhotosModel>()
        self.viewModel = PhotosViewModel(service: service, dataSource: dataSource)
    }

    override func tearDown() {
        self.viewModel = nil
        self.dataSource = nil
        self.service = nil
        super.tearDown()
    }

    func testfetchPhotos() {
        service?.searchData = searchResultsModel
        viewModel?.fetchServiceCall("Initial Test") { (result) in
            switch result {
            case .failure :
                XCTAssert(false, "ViewModel should not be able to fetch without service")
            default:
                break
            }
        }
    }

    func testfetchNoPhotos() {
        service?.searchData = nil
        viewModel?.fetchServiceCall("Initial Test") { (result) in
            switch result {
            case .success :
                XCTAssert(false, "ViewModel should not be able to fetch")
            default: break
            }
        }
    }
}

private let photosModel = PhotosModel(id: "41886638322", owner: "151109375", secret: "9e692e7e1d", server: "959", farm: 1, title: "Alice and Bob", ispublic: 1, isfriend: 0, isfamily: 0)
private let resultsModel = ResultsModel(page: 1, pages: 4, perpage: 20, total: "50", photo: [photosModel])
private let searchResultsModel = SearchResultsModel(stat: "ok", photos: resultsModel)
