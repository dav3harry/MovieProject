//
//  MovieDBDiscoverTableViewCell.swift
//  MovieProject
//
//  Created by Dave Harry on 12/06/20.
//  Copyright © 2020 Dave Harry. All rights reserved.
//

import UIKit
import SDWebImage

class MovieDBDiscoverTableViewCell: UITableViewCell {
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTItle: UILabel!
    @IBOutlet weak var rateMovie: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    var data: MovieDBDiscoverResults? {
        didSet {
            if let  value = self.data {
                let urlString = Credential.URL.basePoster+(value.posterPath ?? "")
                Helper.loadImage(imageView: self.movieImage, url: urlString)
                movieTItle.text = value.title
                rateMovie.text = "\(value.voteAverage ?? 0)"
                releaseDate.text = value.releaseDate
                desc.text  = value.overview
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        [self.movieImage,self.movieTItle,self.rateMovie,self.releaseDate,self.desc].forEach {$0?.showAnimatedSkeleton()}
    }
    
    func hideAnimation() {
        [self.movieImage,self.movieTItle,self.rateMovie,self.releaseDate,self.desc].forEach {$0?.hideSkeleton()}
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
