//
//  DetailsViewController.swift
//  FlickrSearchExample
//
//  Created by Nischal Hada on 6/23/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let dataSource = DetailsViewDataSource()
    var viewModel: DetailsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = dataSource
        self.setupUI()
    }
    
    func setupUI() {
        self.navigationItem.title = viewModel?.dataSource?.title
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.tableView.backgroundColor = ThemeColor.white
        self.view.backgroundColor = ThemeColor.white
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
}


// MARK: - UITableViewDataSource

extension DetailsViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped")
    }
}

// MARK: - TableViewDelegate Setup

extension DetailsViewController : UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
}


