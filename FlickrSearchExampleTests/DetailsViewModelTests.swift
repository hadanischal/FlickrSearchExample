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
