//
//  ListTableViewCell.swift
//  Peliculas
//
//  Created by Alejandro Martinez on 29/04/22.
//

import UIKit
import SwiftUI

class ListTableViewCell: UITableViewCell {

    var name: String?{
        didSet{
        movieName.text = name
        }
    }
    
        
     lazy var placeholderImage: UIImageView = {
        
        let aImage = UIImageView()
        aImage.translatesAutoresizingMaskIntoConstraints = false
        aImage.layer.cornerRadius = 10
         aImage.backgroundColor = .red
        aImage.image = UIImage(named: "short")
        return aImage
    }()
    
    
   
    
 lazy var movieName: UILabel = {
        
        let aLabel = UILabel()
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        aLabel.textColor = .black
        return aLabel
        
    }()
    
    
    
    
    
    
    private lazy var movieDescription: UILabel = {
//
        let blabel = UILabel()
        blabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
        blabel.translatesAutoresizingMaskIntoConstraints = false
        blabel.text = "Ingresa y Conoce Más"
        return blabel
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle,reuseIdentifier: String? ){
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstrains()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    private func setupView(){
        contentView.addSubview(placeholderImage)
        contentView.addSubview(movieName)
        contentView.addSubview(movieDescription)
        
    }
    
    
    private func setupConstrains() {
        
        NSLayoutConstraint.activate([
             
            //image
            placeholderImage.heightAnchor.constraint(equalToConstant: 200),
            placeholderImage.widthAnchor.constraint(equalToConstant: 150),
            placeholderImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            placeholderImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            placeholderImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            //Label
            
            movieName.leadingAnchor.constraint(equalTo: placeholderImage.trailingAnchor,constant: 16),
            movieName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieName.topAnchor.constraint(equalTo: topAnchor),
            movieName.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            //description
           
            movieDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieDescription.leadingAnchor.constraint(equalTo: placeholderImage.trailingAnchor,constant: 16),
            movieDescription.topAnchor.constraint(equalTo: topAnchor),
            movieDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant:50)

    
        ])
    
    
    
    
    }

}
