//
//  MovieDetailViewController.swift
//  Peliculas
//
//  Created by Alejandro Martinez on 30/04/22.
//

import UIKit

    protocol MovieDetailDelegate {
        func showLoading()
        func hideLoading()
        func movieData(movie: MovieDetail)
        func showError()
    }

    class MovieDetailViewController: UIViewController {
        var movieUrl: String = ""
        var movieId: Int = 0
        var name: String? {
                didSet{
                    movieName.text = name
                    }
                }
        
    private var imagen: String? {
        didSet {
                if let url = URL(string: "https://image.tmdb.org/t/p/w500/" + "\(imagen ?? "")")
                {
                    movieImage.load(url: url)
                }
            }
        }
        
        
         var overView: String? {
            didSet{
                movieOverview.text = overView
            }
        }
        
      
        
        
    private lazy var movieBackground: UIView = {
               let aView = UIView()
               aView.translatesAutoresizingMaskIntoConstraints = false
               aView.layer.cornerRadius = 70
               aView.backgroundColor = .white.withAlphaComponent(0.8)
               return aView
           }()
    


    lazy var movieImage: UIImageView = {
        let aimage = UIImageView()
        aimage.translatesAutoresizingMaskIntoConstraints = false
        return aimage
        
    }()
 
       private var service = MovieDetailService()
       private var viewModel: DetailMovieViewModel?
         
    lazy var movieName: UILabel = {
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.font = UIFont.boldSystemFont(ofSize: 25)
        
        return aLabel
        
    }()
        
        lazy var movieOverview: UILabel = {
            let aLabel = UILabel()
            aLabel.translatesAutoresizingMaskIntoConstraints = false
            aLabel.font = UIFont(name: "Avenir", size: 20)
            aLabel.numberOfLines = 0
            return aLabel
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        self.viewModel = DetailMovieViewModel(id: movieId, movieUrl: movieUrl, service: service, delegate: self)
                self.viewModel?.getMovie()
    }
    
        
        
        
        
        private func setupView (){

        view.addSubview(movieImage)
        view.addSubview(movieName)
        view.addSubview(movieOverview)
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.backgroundColor = .white
    }
    
    
    private func setupConstraints (){
        
        NSLayoutConstraint.activate([
                    

                     //imagen
                     movieImage.heightAnchor.constraint(equalToConstant: round(UIScreen.main.bounds.height * 0.6)),
                     movieImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                     movieImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                     movieImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                     movieImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                     //nombre de peliulas
                     movieName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                     movieName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                     movieName.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 30),
                     //descripcion de pelicula
                    movieOverview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                    movieOverview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                    movieOverview.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 80),
                    
                ])
        
        
    }
        
            
        }
extension MovieDetailViewController: MovieDetailDelegate {
    
    func showLoading() {

        
    }
    
    func hideLoading() {

    }
    
    func movieData(movie: MovieDetail) {
        name = movie.title
        imagen = movie.posterPath
        overView = movie.overview
    
//                originalLanguage = movie.originalLanguage
//                popularity = movie.popularity
//                releaseDate = movie.releaseDate
    }
    
    func showError() {
        print("Se rompio todo..")
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.navigationItem.searchController?.viewWillAppear(false)
        
    
}
