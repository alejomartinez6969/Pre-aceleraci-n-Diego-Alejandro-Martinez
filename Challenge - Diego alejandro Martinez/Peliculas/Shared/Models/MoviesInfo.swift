//
//  MoviesInfo.swift
//  Peliculas
//
//  Created by Alejandro Martinez on 3/05/22.
//

import Foundation
struct MovieDetail: Codable {
    let overview: String
    let backdropPath: String?
    let id: Int
    let originalLanguage, releaseDate: String
    let posterPath: String?
    let popularity: Double
    let title: String
 

}
