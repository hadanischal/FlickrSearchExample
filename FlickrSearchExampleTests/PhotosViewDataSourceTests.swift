//
//  PhotosViewDataSourceTests.swift
//  FlickrSearchExampleTests
//
//  Created by Nischal Hada on 6/24/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import XCTest
@testable import FlickrSearchExample

class PhotosViewDataSourceTests: XCTestCase {
    var dataSource : PhotosViewDataSource!
    override func setUp() {
        super.setUp()
        dataSource = PhotosViewDataSource()
    }
    
    override func tearDown() {
        dataSource = nil
        super.tearDown()
    }

    func testEmptyValueInDataSource() {
        dataSource.data.value = []
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: layout)
        collectionView.dataSource = dataSource
        XCTAssertEqual(dataSource.numberOfSections(in: collectionView), 1, "Expected one section in collection view")
        XCTAssertEqual(dataSource.collectionView(collectionView, numberOfItemsInSection: 0), 0, "Expected no cell in collection view")
    }
    
}
