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
    
    func testValueInDataSource() {
        let responseResults:[PhotosModel] = valuesFromJSON()
        dataSource.data.value = responseResults
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: layout)
        collectionView.dataSource = dataSource
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        XCTAssertEqual(dataSource.numberOfSections(in: collectionView), 1, "Expected one section in table view")
        XCTAssertEqual(dataSource.collectionView(collectionView, numberOfItemsInSection: 0), responseResults.count, "Expected responseResults.count cell in collection view")
    }
    
    func testValueCell() {
        dataSource.data.value = valuesFromJSON()
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: UIDevice.current.accessibilityFrame, collectionViewLayout: layout)
        collectionView.dataSource = dataSource
        collectionView.register(PhotoViewCell.self, forCellWithReuseIdentifier: "PhotoViewCell")
        let indexPath = IndexPath(row: 0, section: 0)
        guard let _ = dataSource.collectionView(collectionView, cellForItemAt: indexPath)as? PhotoViewCell else {
            XCTAssert(false, "Expected collectionViewCell class")
            return
        }
    }
    
    func valuesFromJSON() ->[PhotosModel]{
        var responseResults = [PhotosModel]()
        guard let data = FileManager.readJsonFile(forResource: "flickrsample") else {
            XCTAssert(false, "Can't get data from facts.json")
            return responseResults
        }
        let completion : ((Result<SearchResultsModel, ErrorResult>) -> Void) = { result in
            switch result {
            case .failure(_):
                XCTAssert(false, "Expected valid converter")
            case .success(let converter):
                print(converter)
                responseResults = converter.photoResults
                break
            }
        }
        ParserHelper.parse(data: data, completion: completion)
        return responseResults
    }
    
}

extension FileManager {
    static func readJsonFile(forResource fileName: String ) -> Data? {
        let bundle = Bundle(for: PhotosViewDataSourceTests.self)
        if let path = bundle.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                return data
            } catch {
            }
        }
        return nil
    }
}
