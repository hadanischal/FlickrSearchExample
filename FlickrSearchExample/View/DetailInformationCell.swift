//
//  DetailInformationCell.swift
//  FlickrSearchExample
//
//  Created by Nischal Hada on 6/23/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import UIKit

class DetailInformationCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var detailLabel: UILabel?

    var dataValue: DetailModel? {
        didSet {
            guard let data = dataValue else {
                return
            }
            titleLabel?.text = data.title
            detailLabel?.text = data.description
        }
    }

}
