//
//  MovieDBReviewController.swift
//  MovieProject
//
//  Created by Dave Harry on 12/06/20.
//  Copyright © 2020 Dave Harry. All rights reserved.
//

import UIKit

class MovieDBReviewViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var idMovie: String?
    let  viewModel = MovieDBReviewViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setComponent()
        bindData()
    }

    private func setComponent() {
        tableView.register(cellType: MovieDBReviewTableViewCell.self)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = UIColor.clear
        tableView.dataSource = viewModel
    }
    
    private func bindData() {
        if let idMovie = self.idMovie {
            viewModel.getListComment(id: idMovie) { (status) in
                if status == true {
                    self.tableView.reloadData()
                }
            }
        }
    }
}
