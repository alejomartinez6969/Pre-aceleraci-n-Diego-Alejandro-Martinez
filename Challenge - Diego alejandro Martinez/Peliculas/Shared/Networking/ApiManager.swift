//
//  ApiManager.swift
//  Peliculas
//
//  Created by Alejandro Martinez on 2/05/22.
//

import Foundation
import Alamofire

class ApiManager{
    
    static let shared = ApiManager()
    
    func get(url:String, completition: @escaping (Result<Data?, AFError>) ->Void) {
       
        AF.request(url).response { response in
            completition(response.result)
            
        }
    }
    
}
