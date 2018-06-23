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
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
