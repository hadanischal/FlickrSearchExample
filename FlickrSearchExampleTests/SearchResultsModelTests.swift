//
//  SearchResultsModelTests.swift
//  FlickrSearchExampleTests
//
//  Created by Nischal Hada on 6/24/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import XCTest
@testable import FlickrSearchExample

class SearchResultsModelTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExampleEmptySearchResults() {
        let data = Data()
        let completion: ((Result<SearchResultsModel, ErrorResult>) -> Void) = { result in
            switch result {
            case .success:
                XCTAssert(false, "Expected failure when no data")
            default:
                break
            }
        }
        ParserHelper.parse(data: data, completion: completion)
    }

    func testParseSearchResults() {
        guard let data = FileManager.readJsonFile(forResource: "flickrsample") else {
            XCTAssert(false, "Can't get data from flickrsample.json")
            return
        }
        let completion: ((Result<SearchResultsModel, ErrorResult>) -> Void) = { result in
            switch result {
            case .failure:
                XCTAssert(false, "Expected valid converter")
            case .success(let response):
                if let converter = response.photos {
                    XCTAssertEqual(converter.page, 1, "Expected 1 page")
                    XCTAssertEqual(converter.pages, 12459, "Expected 12459 pages")
                    XCTAssertEqual(converter.perpage, 20, "Expected 20 perpage")
                    XCTAssertEqual(converter.total, "249174", "Expected 249174 total")
                    XCTAssertEqual(converter.photo!.count, 20, "Expected 20 photoResults")
                } else {
                    return  XCTAssert(false, "unable to parse response")
                }
            }
        }
        ParserHelper.parse(data: data, completion: completion)
    }

    func testWrongKeySearchResults() {
        let result = SearchResultsModel.parseObject(data: Data())
        switch result {
        case .success:
            XCTAssert(false, "Expected failure when wrong data")
        default:
            return
        }
    }

}
