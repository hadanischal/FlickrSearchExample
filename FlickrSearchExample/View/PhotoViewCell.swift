//
//  PhotoViewCell.swift
//  FlickrSearchExample
//
//  Created by Nischal Hada on 6/22/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import UIKit

class PhotoViewCell: UICollectionViewCell {
    @IBOutlet weak var bagroundView: UIView?
    @IBOutlet var titleLabel: UILabel?
    @IBOutlet var photoImageView: UIImageView?
    
    var photosValue : PhotosModel? {
        didSet {
            guard let feeds = photosValue else {
                return
            }
            titleLabel?.text = feeds.title
            ImageManager.sharedInstance.downloadImageFromURL(feeds.flickrImageURL()) { (success, image) -> Void in
                if success && image != nil {
                    self.photoImageView?.image = image
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bagroundView?.backgroundColor = ThemeColor.white
        self.photoImageView?.contentMode =   UIViewContentMode.scaleAspectFit
    }
}
