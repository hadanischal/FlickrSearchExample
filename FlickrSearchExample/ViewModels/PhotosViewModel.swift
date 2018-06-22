//
//  PhotosViewModel.swift
//  FlickrSearchExample
//
//  Created by Nischal Hada on 6/22/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import Foundation

class  PhotosViewModel {
    // MARK: - Input
    weak var dataSource : GenericDataSource<PhotosModel>?
    
    // MARK: - Output
    weak var service: PhotosServiceCallProtocol?
    var onErrorHandling : ((ErrorResult?) -> Void)?

    init(service: PhotosServiceCallProtocol? = PhotosServiceCall.shared, dataSource : GenericDataSource<PhotosModel>?) {
        self.dataSource = dataSource
        self.service = service
    }
    
    func fetchServiceCall(_ completion: ((Result<Bool, ErrorResult>) -> Void)? = nil) {
        
        guard let service = service else {
            onErrorHandling?(ErrorResult.custom(string: "Missing service"))
            return
        }
        service.fetchPhotos { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let converter) :
                    self.dataSource?.data.value = converter.photoResults
                    completion?(Result.success(true))
                    break
                case .failure(let error) :
                    print("Parser error \(error)")
                    self.onErrorHandling?(error)
                    completion?(Result.failure(error))
                    break
                }
            }
        }
    }
}
