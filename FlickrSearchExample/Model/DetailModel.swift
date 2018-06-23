//
//  DetailModel.swift
//  FlickrSearchExample
//
//  Created by Nischal Hada on 6/23/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import Foundation

struct DetailModel{
    let title: String?
    let description: String?
    init(title: String, description: String){
        self.title = title
        self.description = description
    }
}

extension DetailModel{
    static func setupDetailModel() -> [DetailModel]{
        let detail: [DetailModel] = [
            DetailModel(title: "Title", description: "tiltle 1"),
            DetailModel(title: "Farm", description: "description 1"),
            ]
        return detail
    }
}
