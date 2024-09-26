//
//  MyTableView.swift
//  Table Adv
//
//  Created by Shivam Kumar on 04/09/24.
//

import Foundation
import UIKit

class MyTableViewCell : UITableViewCell{
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 0.2
        return view
    }()
    
    let animalLabel: UILabel = {
       let label = UILabel ()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    let animalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCellView()
    }
    
   
    func setUpCellView(){
        animalImageView.clipsToBounds = true
        animalImageView.layer.cornerRadius = 20
        
        
        contentView.addSubview(containerView)
        
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 10, height: 10)
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowRadius = 3
        containerView.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
        containerView.layer.shouldRasterize = true
        containerView.layer.rasterizationScale = UIScreen.main.scale
        
        containerView.addSubview(animalLabel)
        containerView.addSubview(animalImageView)
        
        
        let animalLabelConstraints: [NSLayoutConstraint] = [
            animalLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            animalLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ]
        let animalImageViewConstraints:[NSLayoutConstraint] = [
            animalImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            animalImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            animalImageView.widthAnchor.constraint(equalToConstant: 200),
            animalImageView.heightAnchor.constraint(equalToConstant: 150)
        ]
        let contentViewConstraints:[NSLayoutConstraint] = [
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
        ]
        
        NSLayoutConstraint.activate(animalLabelConstraints)
        NSLayoutConstraint.activate(animalImageViewConstraints)
        NSLayoutConstraint.activate(contentViewConstraints)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

