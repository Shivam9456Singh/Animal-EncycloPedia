//
//  AnimalDetailView.swift
//  Table Adv
//
//  Created by Shivam Kumar on 04/09/24.
//

import Foundation
import UIKit

class AnimalDetailViewController: UIViewController {
    let animalImage: UIImageView = UIImageView()
    let animalDetails: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        createViews()
    }
    
    func createViews(){
        
        animalImage.clipsToBounds = true
        animalImage.translatesAutoresizingMaskIntoConstraints  = false
        animalImage.contentMode = .scaleAspectFill
        animalImage.layer.cornerRadius = 10
        animalImage.layer.borderColor = UIColor.black.cgColor
        animalImage.layer.borderWidth = 0.3
        
        animalDetails.font = .systemFont(ofSize: 26)
        animalDetails.textAlignment = .center
        animalDetails.numberOfLines = 0
        animalDetails.translatesAutoresizingMaskIntoConstraints = false
        animalDetails.clipsToBounds = true
        
        
        view.addSubview(animalImage)
        view.addSubview(animalDetails)
        
        
        let animalImageConstraints:[NSLayoutConstraint] = [
            animalImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            animalImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 20),
            animalImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            animalImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            animalImage.heightAnchor.constraint(equalToConstant: 300)
            
        ]
        let animalDetailsConstraints:[NSLayoutConstraint] = [
            animalDetails.topAnchor.constraint(equalTo: animalImage.bottomAnchor,constant: 20),
            animalDetails.centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 20),
            animalDetails.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            animalDetails.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            
        ]
        
        NSLayoutConstraint.activate(animalImageConstraints + animalDetailsConstraints)
        
    }
    
}
