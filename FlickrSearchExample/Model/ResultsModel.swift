//
//  ResultsModel.swift
//  FlickrSearchExample
//
//  Created by Nischal Hada on 6/30/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import Foundation

struct ResultsModel: Codable {
    var page: Int?
    var pages: Int?
    var perpage: Int?
    var total: String?
    var photo: [PhotosModel]?
}
