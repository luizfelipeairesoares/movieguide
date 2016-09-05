//
//  MovieTableViewCell.swift
//  movieguide
//
//  Created by Luiz Aires Soares on 9/1/16.
//  Copyright © 2016 ArcTouch. All rights reserved.
//

import UIKit
import Kingfisher

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    
    internal static func cellIdentifier() -> String {
        return "\(self)" + "Identifier"
    }
    
    internal func configureCell(movie: Movie) {
        self.lblTitle.text = movie.title
//        var genres = ""
//        for genre in movie.genres! {
//            genres = genres + genre.name!
//        }
        self.lblGenre.text = ""
        self.lblReleaseDate.text = movie.releaseDate
        guard let p = movie.poster else {
            return
        }
        let url = "http://image.tmdb.org/t/p/original\(p)"
        self.imgPoster.kf_setImageWithURL(NSURL(string: url)!)
    }
    
}
