//
//  MovieDetailViewController.swift
//  movieguide
//
//  Created by Luiz Aires Soares on 9/4/16.
//  Copyright © 2016 ArcTouch. All rights reserved.
//

import UIKit
import Kingfisher
import PKHUD

class MovieDetailViewController: UIViewController {
    
    private weak var viewModel: MovieViewModel? = nil
    
    @IBOutlet weak var imgBackdrop: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblGenres: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.viewModel?.assignController(self)
        self.viewModel?.requestMovie()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Auxiliar Functions
    
    internal func assignViewModel(viewModel: MovieViewModel) {
        self.viewModel = viewModel
    }
    
    private func updateUI() {
        guard let vm = self.viewModel else {
            return
        }
        self.title = self.viewModel!.selectedMovie!.originalTitle!
        self.lblTitle.text = self.viewModel?.selectedMovie?.originalTitle
        var genres = ""
        for genre in self.viewModel!.selectedMovie!.genres! {
            genres = genres + " \(genre.name!)"
        }
        self.lblGenres.text = genres
        let avg = String(self.viewModel!.selectedMovie!.voteAvg!)
        self.lblRating.text = "Rating \(avg)"
        self.lblReleaseDate.text = "Release Date: \(self.viewModel!.selectedMovie!.releaseDate!)"
        self.lblOverview.text = self.viewModel?.selectedMovie?.overview
        guard let backdrop = vm.selectedMovie!.backdrop else {
            return
        }
        let url = "http://image.tmdb.org/t/p/original\(backdrop)"
        self.imgBackdrop.kf_setImageWithURL(NSURL(string: url))
    }

}

extension MovieDetailViewController: MovieProtocol {
    
    func hideLoading() {
        HUD.hide()
        self.updateUI()
    }
    
}
