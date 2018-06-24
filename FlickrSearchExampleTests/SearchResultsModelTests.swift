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
        let completion : ((Result<SearchResultsModel, ErrorResult>) -> Void) = { result in
            switch result {
            case .success(_):
                XCTAssert(false, "Expected failure when no data")
            default:
                break
            }
        }
        ParserHelper.parse(data: data, completion: completion)
    }
    
    func testParseSearchResults(){
        guard let data = FileManager.readJsonFile(forResource: "flickrsample") else {
            XCTAssert(false, "Can't get data from flickrsample.json")
            return
        }
        let completion : ((Result<SearchResultsModel, ErrorResult>) -> Void) = { result in
            switch result {
            case .failure(_):
                XCTAssert(false, "Expected valid converter")
            case .success(let converter):
                XCTAssertEqual(converter.page, 1, "Expected 1 page")
                XCTAssertEqual(converter.pages, 12459, "Expected 12459 pages")
                XCTAssertEqual(converter.perpage, 20, "Expected 20 perpage")
                XCTAssertEqual(converter.total, "249174", "Expected 249174 total")
                XCTAssertEqual(converter.photoResults.count, 20, "Expected 20 photoResults")
         }
        }
        ParserHelper.parse(data: data, completion: completion)
     }

    func testWrongKeySearchResults() {
        let dictionary = ["testObject" : 123 as AnyObject]
        let result = SearchResultsModel.parseObject(dictionary: dictionary)
        switch result {
        case .success(_):
            XCTAssert(false, "Expected failure when wrong data")
        default:
            return
        }
    }

}
