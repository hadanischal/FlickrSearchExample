//
//  DetailsViewController.swift
//  FlickrSearchExample
//
//  Created by Nischal Hada on 6/23/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView?
    var activityIndicator: ActivityIndicator? = ActivityIndicator()
    var selectedData: PhotosModel?
    let dataSource = DetailsViewDataSource()
    lazy var viewModel: DetailsViewModel = {
        let viewModel = DetailsViewModel(dataSource: dataSource)
        return viewModel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupViewModel()
        self.setupTableView()
    }

    func setupUI() {
        self.navigationItem.title = "Details"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.view.backgroundColor = ThemeColor.white
    }

    func setupTableView() {
        self.tableView?.backgroundColor = ThemeColor.tableViewBackgroundColor
        self.view.backgroundColor = ThemeColor.tableViewBackgroundColor
        self.tableView?.tableFooterView = UIView(frame: CGRect.zero)
    }

    func setupViewModel() {
        self.tableView?.dataSource = self.dataSource
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        self.activityIndicator?.start()
        self.viewModel.fetchDataSource(photoData: self.selectedData) { _ in
            DispatchQueue.main.async {
                self.activityIndicator?.stop()
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.tableView?.reloadData()
            }
        }
        self.dataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.tableView?.reloadData()
        }
    }
}

// MARK: - TableViewDelegate Setup
extension DetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return UITableView.automaticDimension
        default:
            return 60
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return UITableView.automaticDimension
        default:
            return 60
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped")
    }
}
