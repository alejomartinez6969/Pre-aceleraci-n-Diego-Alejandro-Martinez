//
//  DetailMovieViewModel.swift
//  Peliculas
//
//  Created by Alejandro Martinez on 5/05/22.
//

import Foundation


class DetailMovieViewModel {

    private var delegate: MovieDetailDelegate
    private var service: MovieDetailService
    var movieUrl: String
    private var movieId: Int
    
    init(id: Int, movieUrl: String, service: MovieDetailService, delegate: MovieDetailDelegate) {
        self.movieId = id
        self.movieUrl = movieUrl
        self.service = service
        self.delegate = delegate
    }
    
    func getMovie(){
        self.delegate.showLoading()
        service.getMovie(id: movieId, urlMovie: movieUrl) { movie in
            self.delegate.movieData(movie: movie)
            self.delegate.hideLoading()
        } onError: {
            self.delegate.hideLoading()
            self.delegate.showError()
        }

    }
}
