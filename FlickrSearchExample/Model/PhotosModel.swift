//
//  PhotosModel.swift
//  FlickrSearchExample
//
//  Created by Nischal Hada on 6/22/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import Foundation

struct PhotosModel: Codable {
    var id: String?
    var owner: String?
    var secret: String?
    var server: String?
    var farm: Int?
    var title: String?
    var ispublic: Int?
    var isfriend: Int?
    var isfamily: Int?

    func flickrImageURL(_ size: String = "m") -> String? {
        if
            let farm = self.farm,
            let server = self.server,
            let id = self.id,
            let secret = self.secret {
            let url =  "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_\(size).jpg"
            return url
        }
        return nil
    }
}
