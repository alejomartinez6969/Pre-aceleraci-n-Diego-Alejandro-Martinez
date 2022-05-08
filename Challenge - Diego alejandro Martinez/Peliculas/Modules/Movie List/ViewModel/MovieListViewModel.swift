//
//  MovieListViewModel.swift
//  Peliculas
//
//  Created by Alejandro Martinez on 3/05/22.
//

import Foundation


class MovieListViewModel {
    
    private var service: MovieListService
    private var delegate: MovieListDelegate
    private var movies =  [Movies]()
    
    
    init (service: MovieListService, delegate: MovieListDelegate) {
        self.service = service
        self.delegate = delegate
    }
    
    func getMovies(){
        self .delegate.toogleLoading()
        service.getMovies(){ movies in
            self.movies = movies
            self.delegate.reloadTable()
            self.delegate.toogleLoading()
        } onError: {
            self.delegate.showError()
            self.delegate.toogleLoading()
        }
        
    }
    
    func getMovies(at index: Int) -> Movies {
        return movies[index]
    }
    
    func getMoviesCount () -> Int {
        return movies.count
    }
}
