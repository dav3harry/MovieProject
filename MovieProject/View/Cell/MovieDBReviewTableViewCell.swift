//
//  MovieDBReviewTableViewCell.swift
//  MovieProject
//
//  Created by Dave Harry on 12/06/20.
//  Copyright © 2020 Dave Harry. All rights reserved.
//

import UIKit

class MovieDBReviewTableViewCell: UITableViewCell {
    @IBOutlet weak var userAuthor: UILabel!
    @IBOutlet weak var commentReview: UILabel!
    
    var review: MovieDBMovieReviewResults? {
        didSet {
            guard let value = self.review else {
                return
            }
            self.userAuthor.text = "Author: "+(value.author ?? "")
            self.commentReview.text = value.content
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}

