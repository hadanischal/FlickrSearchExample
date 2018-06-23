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
    
    var photosValue : PhotosModel? {
        didSet {
            guard let data = photosValue else {
                return
            }
            titleLabel?.text = data.title
            ImageManager.sharedInstance.downloadImageFromURL(data.flickrImageURL()) { (success, image) -> Void in
                if success && image != nil {
                    self.photoImageView?.image = image
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.photoImageView?.contentMode =   UIViewContentMode.scaleAspectFit
    }
}
