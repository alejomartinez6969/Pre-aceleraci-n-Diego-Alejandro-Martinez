//
//  ListViewController.swift
//  Peliculas
//
//  Created by Alejandro Martinez on 28/04/22.
//

import UIKit

protocol MovieListDelegate {
    func reloadTable()
    func showError()
    func toogleLoading()
}


class ListViewController: UIViewController{
   
    
    
    private var service = MovieListService()
    private var viewModel: MovieListViewModel?
    

    
    private lazy var tableView:UITableView = {
        let atable = UITableView()
        atable.translatesAutoresizingMaskIntoConstraints = false
   
        return atable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstrains()
        self.viewModel = MovieListViewModel(service: service, delegate: self)
        self.viewModel?.getMovies()
    }
       
    private func setupView() {
        
        view.addSubview(tableView)
        title = "Lista de Peliculas"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ListTableViewCell.self,forCellReuseIdentifier: String(describing: ListTableViewCell.self))
      
    }

    private func setupConstrains() {
        
        NSLayoutConstraint.activate([
        
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        
        ])

}
}
extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let movieDetailViewController = MovieDetailViewController()
        
        let movies = viewModel?.getMovies(at: indexPath.row)
        movieDetailViewController.movieId = movies?.id ?? 0
        self.navigationController?.pushViewController(movieDetailViewController, animated: true)
        
        
    }
    

}

extension ListViewController: MovieListDelegate{
    
    func toogleLoading() {
        print ("deberia cargar ")
    }
    
    func reloadTable() {
        tableView.reloadData()
    }
    
    func showError() {
        print("error")
    }
    
    
    
    
}


extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ListTableViewCell.self), for: indexPath)
                as? ListTableViewCell else{
            return UITableViewCell()
        }
        let movies = viewModel?.getMovies(at: indexPath.row)
        cell.movieName.text = movies?.title
            
        if let url = URL(string: "https://image.tmdb.org/t/p/w500/" + "\(movies?.posterPath ?? "")")
        {
            
            cell.placeholderImage.load(url: url )
            }
       
        return cell
        
        
        
        
        }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.getMoviesCount() ?? 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated: false)
        
    }
    
    
    }
    
    
   
    










