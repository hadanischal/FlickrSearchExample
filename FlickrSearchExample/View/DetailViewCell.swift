//
//  DetailViewCell.swift
//  FlickrSearchExample
//
//  Created by Nischal Hada on 6/23/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import UIKit

class DetailViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var photoImageView: UIImageView?

    var dataValue: DetailModel? {
        didSet {
            guard let data = dataValue else {
                return
            }
            titleLabel?.text = data.title
            if let imageUrl = data.description {
                ImageManager.sharedInstance.downloadImageFromURL(imageUrl) { (success, image) -> Void in
                    if success && image != nil {
                        self.photoImageView?.image = image
                    }
                }
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.photoImageView?.contentMode =   UIView.ContentMode.scaleAspectFit
    }
}
