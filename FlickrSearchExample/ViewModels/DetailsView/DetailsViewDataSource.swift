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
    var data: DynamicValue<[T]> = DynamicValue([])
}

class DetailsViewDataSource: DetailsDataSource<DetailModel>,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"DetailInformationCell", for: indexPath) as! DetailInformationCell
        return cell
    }
}
