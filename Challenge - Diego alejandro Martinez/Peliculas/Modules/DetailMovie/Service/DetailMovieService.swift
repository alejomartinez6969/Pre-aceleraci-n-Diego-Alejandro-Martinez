//
//  DetailMovieService.swift
//  Peliculas
//
//  Created by Alejandro Martinez on 5/05/22.
//

import Foundation




class MovieDetailService {

    func getMovie(id: Int, urlMovie: String, onComplete: @escaping (MovieDetail) -> Void, onError: @escaping () -> Void) {

        let URL = Constants().movieURL.replacingOccurrences(of:"ID_MOVIE", with: "\(id)")
        ApiManager.shared.get(url: URL) { response in

        switch response {
        case .success(let data):
           do {
               if let data = data {
                   let decoder = JSONDecoder()
                   decoder.keyDecodingStrategy = .convertFromSnakeCase
                   let movieDetail = try decoder.decode(MovieDetail.self, from: data)
                   onComplete(movieDetail)
               } else {
                   onError()
               }
           } catch {
               onError()
           }
        case .failure(_):
           onError()
        }
    }
 }
}

