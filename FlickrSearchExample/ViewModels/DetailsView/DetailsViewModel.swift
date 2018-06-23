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
    var dataSource :PhotosModel?  //DetailsDataSource<PhotosModel>?
    
    init(dataSource :PhotosModel?){
        //DetailsDataSource<PhotosModel>?) {
        self.dataSource = dataSource
    }
    
}
