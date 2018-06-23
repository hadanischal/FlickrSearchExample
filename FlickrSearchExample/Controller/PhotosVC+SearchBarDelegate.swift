//
//  PhotosVC+SearchBarDelegate.swift
//  FlickrSearchExample
//
//  Created by Nischal Hada on 6/22/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UISearchBarDelegate Setup
extension PhotosViewController : UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        // searchActive = false;
        self.searchBarSearchBegin(searchBar)
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchActive = true
    }
    
    func searchBarSearchBegin(_ searchBar: UISearchBar) {
        if !searchBar.text!.isEmpty {
            let searchText:String =  searchBar.text!.replacingOccurrences(of: " ", with: "")
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = true
                self.activityIndicator.start()
                self.viewModel.fetchServiceCall(searchText){ result in
                    self.activityIndicator.stop()
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    self.searchActive = false
                    self.collectionView.reloadData()
                }
            }
        }else{
            searchActive = false;
        }
    }
}
