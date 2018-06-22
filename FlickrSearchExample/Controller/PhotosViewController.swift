//
//  PhotosViewController.swift
//  FlickrSearchExample
//
//  Created by Nischal Hada on 6/22/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    fileprivate let sectionInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
    fileprivate let itemsPerRow: CGFloat = 2
    var activityIndicator : ActivityIndicator! = ActivityIndicator()
    var searchActive : Bool = false
    let dataSource = PhotosViewDataSource()
    lazy var viewModel : PhotosViewModel = {
        let viewModel = PhotosViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupViewModel()
    }
    
    func setupUI() {
        self.title = "Flickr Search"
        self.view.backgroundColor = ThemeColor.white
    }

    func setupViewModel() {
        self.collectionView.dataSource = self.dataSource
        self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.collectionView.reloadData()
        }
        self.viewModel.onErrorHandling = { [weak self] error in
            self?.showAlert(title: "An error occured", message: "Oops, something went wrong!")
        }
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension PhotosViewController : UICollectionViewDelegateFlowLayout {
    func setupCollectionView() -> Void{
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = UICollectionViewScrollDirection.vertical
        self.collectionView.collectionViewLayout = layout
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        self.collectionView.backgroundColor = ThemeColor.tableViewBackgroundColor
        self.collectionView.showsHorizontalScrollIndicator = false
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItem")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        let heightPerItem = widthPerItem + 21
        return CGSize(width: widthPerItem, height: heightPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return sectionInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 0
    }
}




