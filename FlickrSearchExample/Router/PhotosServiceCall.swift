//
//  PhotosServiceCall.swift
//  FlickrSearchExample
//
//  Created by Nischal Hada on 6/22/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import Foundation

protocol PhotosServiceCallProtocol: class {
    func fetchPhotos(_ searchTerm: String, completion: @escaping ((Result<SearchResultsModel, ErrorResult>) -> Void))
}

final class PhotosServiceCall: NetworkHandler, PhotosServiceCallProtocol {
    static let shared = PhotosServiceCall()
    let endpoint = APIConstants.baseURLString
    
    var task : URLSessionTask?
    
    func fetchPhotos(_ searchTerm: String, completion: @escaping ((Result<SearchResultsModel, ErrorResult>) -> Void)) {
        self.cancelFetchService()

        var parameters : [String: String] = [
            APIConstants.methodKey:          APIConstants.APIMethods_PhotosSearch,
            APIConstants.apiKey:             APIConstants.apiKeyValue,
            APIConstants.nojsoncallbackKey:  "1",
            APIConstants.formatKey:          "json",
            APIConstants.safeSearchKey:      "1",
            APIConstants.textKey:            searchTerm,
            APIConstants.perPageKey:         APIConstants.limit,
            APIConstants.pageKey:            "1" //Default for now
        ]
        if searchTerm.isEmpty{
            parameters[APIConstants.latKey] = APIConstants.latConst
            parameters[APIConstants.longKey] = APIConstants.lonConst
            parameters[APIConstants.textKey] = "Nearby"
        }

        task = NetworkService().loadData(urlString: endpoint, parameters: parameters, completion: self.networkResult(completion: completion))
    }
    func cancelFetchService() {
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}

