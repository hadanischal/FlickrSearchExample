//
//  DetailsViewDataSource.swift
//  FlickrSearchExample
//
//  Created by Nischal Hada on 6/23/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import Foundation
import UIKit

class DetailsDataSource<T>: NSObject {
    var data: DynamicValue<Any> =  DynamicValue((Any).self)
 
}

class DetailsViewDataSource: DetailsDataSource<PhotosModel>,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"DetailViewCell", for: indexPath) as! DetailViewCell
        cell.photosValue = data.value as? PhotosModel
        return cell
    }
}
