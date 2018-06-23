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
    //<[T]> = DynamicValue([])
}

class DetailsViewDataSource: DetailsDataSource<Any> {
    
}
