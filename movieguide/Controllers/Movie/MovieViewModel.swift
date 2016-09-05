//
//  MovieViewModel.swift
//  movieguide
//
//  Created by Luiz Aires Soares on 9/4/16.
//  Copyright © 2016 ArcTouch. All rights reserved.
//

import Foundation

protocol MovieProtocol: class, ControllersProtocol {
    
}

class MovieViewModel {
    
    private weak var movieController: MovieProtocol?
    
    private var movies: [Movie] = []
    internal var filteredMovies: [Movie] = []
    internal var selectedMovie: Movie? = nil
    private var movieID: Int? = nil
    
    internal func assignController(controller: MovieProtocol) {
        self.movieController = controller
    }
    
    // MARK - Requests:
    
    internal func requestUpcoming() {
        self.movieController?.showLoading()
        MoviesService().upcomingMovies { (result) in
            switch result {
            case .success(let movies):
                self.movies = movies
                self.filteredMovies = self.movies
                self.movieController?.hideLoading()
            case .failure(let error):
                self.movieController?.showError(error.message())
            }
        }
    }
    
    internal func requestMovie() {
        self.movieController?.showLoading()
        let id = String(self.movieID!)
        MoviesService().requestSelectedMovie(id) { (result) in
            switch result {
            case .success(let movie):
                self.selectedMovie = movie
                self.movieController?.hideLoading()
            case .failure(let error):
                self.movieController?.showError(error.message())
            }
        }
    }
    
    // MARK - Auxiliar Functions
    
    internal func filter(text: String) {
        self.filteredMovies.removeAll()
        if (text == "") {
            self.filteredMovies = self.movies
        } else {
            self.filteredMovies = self.movies.filter({ (movie) -> Bool in
                return movie.originalTitle?.containsString(text) == true
            })
        }
        self.movieController?.hideLoading()
    }
    
    internal func selectMovie(index: Int) {
        let movie = self.filteredMovies[index]
        self.movieID = movie.id
    }
}
