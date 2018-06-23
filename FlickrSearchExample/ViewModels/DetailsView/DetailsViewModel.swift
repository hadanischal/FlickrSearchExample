//
//  DetailsViewModel.swift
//  FlickrSearchExample
//
//  Created by Nischal Hada on 6/23/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import Foundation

class  DetailsViewModel {
    // MARK: - Input
    weak var dataSource : DetailsDataSource<DetailModel>?
    
    init(photoData :PhotosModel?, dataSource :DetailsDataSource<DetailModel>?){
        self.dataSource = dataSource
    }
    
    func fetchDataSource(photoData :PhotosModel?, completion: ((Result<Bool, ErrorResult>) -> Void)? = nil) {
        self.dataSource?.data.value = DetailModel.setupDetailModel(photoData!)
        completion?(Result.success(true))
    }
}
