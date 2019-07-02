//
//  SearchResultsModel.swift
//  FlickrSearchExample
//
//  Created by Nischal Hada on 6/22/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import Foundation

struct SearchResultsModel: Codable {
    var stat: String?
    var photos: ResultsModel?
}

extension SearchResultsModel: Parceable {
    static func parseObject(data: Data) -> Result<SearchResultsModel, ErrorResult> {
        let decoder = JSONDecoder()
        if let result = try? decoder.decode(SearchResultsModel.self, from: data) {
            return Result.success(result)
        } else {
            return Result.failure(ErrorResult.parser(string: "Unable to parse flickr results"))
        }
    }
}
