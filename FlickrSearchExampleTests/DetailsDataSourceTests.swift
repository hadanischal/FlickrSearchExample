//
//  DetailsDataSourceTests.swift
//  FlickrSearchExampleTests
//
//  Created by Nischal Hada on 6/24/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import XCTest
@testable import FlickrSearchExample

class DetailsDataSourceTests: XCTestCase {
    var dataSource: DetailsViewDataSource?
    override func setUp() {
        super.setUp()
        dataSource = DetailsViewDataSource()
    }

    override func tearDown() {
        dataSource = nil
        super.tearDown()
    }

    func testEmptyValueInDataSource() {
        dataSource?.data.value = []  // giving empty data value
        let tableView = UITableView()
        tableView.dataSource = dataSource
        XCTAssertEqual(dataSource?.numberOfSections(in: tableView), 1, "Expected one section in table view")
        XCTAssertEqual(dataSource?.tableView(tableView, numberOfRowsInSection: 0), 0, "Expected no cell in table view")
    }

    func testValueInDataSource() {
        if valuesFromJSON().count != 0 {
            let responseResults: [PhotosModel] = valuesFromJSON()
            let photoData = responseResults[0]
            dataSource?.data.value = DetailModel.setupDetailModel(photoData)
            let tableView = UITableView()
            tableView.dataSource = dataSource
            XCTAssertEqual(dataSource?.numberOfSections(in: tableView), 1, "Expected one section in table view")
            XCTAssertEqual(dataSource?.tableView(tableView, numberOfRowsInSection: 0), 6, "Expected six cell in table view")
        } else {
            XCTAssert(false, "Can't get data from FileManager")
        }
    }

    func valuesFromJSON() -> [PhotosModel] {
        var responseResults = [PhotosModel]()
        guard let data = FileManager.readJsonFile(forResource: "flickrsample") else {
            XCTAssert(false, "Can't get data from flickrsample.json")
            return responseResults
        }
        let completion: ((Result<SearchResultsModel, ErrorResult>) -> Void) = { result in
            switch result {
            case .failure:
                XCTAssert(false, "Expected valid flickrsample")
            case .success(let response):
                print(response)
                guard let converter = response.photos else {
                    return  XCTAssert(false, "unable to parse response")
                }
                guard let photo = converter.photo else {
                    return  XCTAssert(false, "unable to parse response")
                }
                responseResults = photo
                break
            }
        }
        ParserHelper.parse(data: data, completion: completion)
        return responseResults
    }
}
