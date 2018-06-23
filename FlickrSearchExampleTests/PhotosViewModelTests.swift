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
    
    var viewModel : PhotosViewModel!
    var dataSource : GenericDataSource<PhotosModel>!
    fileprivate var service : MockPhotosServiceCall!

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
        service.searchData = SearchResultsModel(page: 1, pages: 1, perpage: 1, total: "1", photoResults: [])
        viewModel.fetchServiceCall("Initial Test") { (result) in
            switch result {
            case .failure(_) :
                XCTAssert(false, "ViewModel should not be able to fetch without service")
            default: break
            }
        }
    }
    
    func testfetchNoPhotoss() {
        service.searchData = nil
        viewModel.fetchServiceCall("Initial Test") { (result) in
            switch result {
            case .success(_) :
                XCTAssert(false, "ViewModel should not be able to fetch")
            default: break
            }
        }
    }
}
