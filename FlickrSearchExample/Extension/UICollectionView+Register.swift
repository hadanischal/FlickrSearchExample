//
//  UICollectionView+Register.swift
//  FlickrSearchExample
//
//  Created by Nischal Hada on 16/9/19.
//  Copyright © 2019 NischalHada. All rights reserved.
//

import UIKit

extension UICollectionView {

    func register<T: UICollectionViewCell>(_: T.Type){
        register(UINib(nibName: String(describing: T.self), bundle: nil), forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T
            else { fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)") }
        return cell
    }
}
