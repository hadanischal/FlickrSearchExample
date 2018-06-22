//
//  PhotosServiceCall.swift
//  FlickrSearchExample
//
//  Created by Nischal Hada on 6/22/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import Foundation

protocol PhotosServiceCallProtocol: class {
    func fetchConverter(_ completion: @escaping ((Result<PhotosModel, ErrorResult>) -> Void))
}

final class PhotosServiceCall: NetworkHandler, PhotosServiceCallProtocol {
    static let shared = PhotosServiceCall()
    let endpoint = APIConstants.baseURLString
    let searchText = "Temp"
    static let escapedSearchText: String = "Temp".addingPercentEncoding(withAllowedCharacters:.urlHostAllowed)!
    
  //  let urlString: String = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(APIConstants.apiKeyValue)&tags=\(escapedSearchText)&per_page=25&format=json&nojsoncallback=1"

    var task : URLSessionTask?
    let parameters : [String: String] = [
        APIConstants.methodKey:          APIConstants.flickrMethod,
        APIConstants.apiKey:             APIConstants.apiKeyValue,
        APIConstants.nojsoncallbackKey:  "1",
        APIConstants.formatKey:          "json",
        APIConstants.safeSearchKey:      "1",
        APIConstants.textKey:            "Lets Search", //Default for now
        APIConstants.perPageKey:         APIConstants.limit,
        APIConstants.pageKey:            "1" //Default for now
    ]
    
    func fetchConverter(_ completion: @escaping ((Result<PhotosModel, ErrorResult>) -> Void)) {
        self.cancelFetchService()
        task = NetworkService().loadData(urlString: endpoint, parameters: parameters, completion: self.networkResult(completion: completion))
    }
    
    func cancelFetchService() {
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}

