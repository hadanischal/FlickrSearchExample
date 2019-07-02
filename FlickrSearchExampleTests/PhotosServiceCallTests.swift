//
//  PhotosServiceCallTests.swift
//  FlickrSearchExampleTests
//
//  Created by Nischal Hada on 6/24/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import XCTest
@testable import FlickrSearchExample

class PhotosServiceCallTests: XCTestCase {

    func testCancelRequest() {
        let service: PhotosServiceCall! = PhotosServiceCall()
        service.fetchPhotos("test") { (_) in
        }
        service.cancelFetchService()
        XCTAssertNil(service.task, "Expected task nil")
    }
}
