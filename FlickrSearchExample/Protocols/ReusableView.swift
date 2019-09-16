//
//  ReusableView.swift
//  FlickrSearchExample
//
//  Created by Nischal Hada on 16/9/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit

protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self) + "Identifier"
    }
}
