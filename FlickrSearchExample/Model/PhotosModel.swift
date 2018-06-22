//
//  PhotosModel.swift
//  FlickrSearchExample
//
//  Created by Nischal Hada on 6/22/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import Foundation

struct PhotosModel {
    
}

extension PhotosModel : Parceable {
    static func parseObject(dictionary: [String : AnyObject]) -> Result<PhotosModel, ErrorResult> {
        return Result.failure(ErrorResult.parser(string: "Unable to parse conversion rate"))

    }
}
