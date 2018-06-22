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
    var task : URLSessionTask?
    
    func fetchConverter(_ completion: @escaping ((Result<PhotosModel, ErrorResult>) -> Void)) {
        self.cancelFetchService()
        task = NetworkService().loadData(urlString: endpoint, completion: self.networkResult(completion: completion))
    }
    
    func cancelFetchService() {
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}

