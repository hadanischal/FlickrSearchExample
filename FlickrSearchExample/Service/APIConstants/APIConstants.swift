//
//  APIConstants.swift
//  FlickrSearchExample
//
//  Created by Nischal Hada on 6/22/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import Foundation

struct APIConstants {
     static let baseURLString = "https://api.flickr.com/services/rest"
//    private static let Secret = "fd9869de82b522fa?"

    //API Methods Name
    static let APIMethods_PhotosSearch =  "flickr.photos.search"
    static let apiKeyValue  =  "63f750f7c42662239caa7482194185b4"
    static let limit        =  "20"
    static let methodKey =         "method"
    static let apiKey    =         "api_key"
    static let nojsoncallbackKey = "nojsoncallback"
    static let formatKey =         "format"
    static let safeSearchKey =     "safe_search"
    static let textKey =           "text"
    static let perPageKey =        "per_page"
    static let pageKey =           "page"
    static let latKey =           "lat"
    static let longKey =           "lon"
}
