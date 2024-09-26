//
//  ViewController.swift
//  Table Adv
//
//  Created by Shivam Kumar on 04/09/24.
//

import UIKit

class ViewController: UIViewController {
   
    let animalModel = AnimalModel()
    private var labelHeading: UILabel = UILabel()
    var tableView: UITableView = UITableView()
    private var animalImage: UIImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "cell")
        createView()
    }
    
    
    private func createView(){
        labelHeading.text = "Animal List"
        labelHeading.textAlignment = .center
        labelHeading.translatesAutoresizingMaskIntoConstraints = false
        labelHeading.clipsToBounds = true
        labelHeading.numberOfLines = 0
        view.addSubview(labelHeading)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = 0
        tableView.delegate = self
        tableView.isUserInteractionEnabled = true
        
        view.addSubview(tableView)
        
        
        
        let labelConstraints: [NSLayoutConstraint] = [
            labelHeading.topAnchor.constraint(equalTo: view.topAnchor,constant: 70),
            labelHeading.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            labelHeading.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ]
        let tableViewConstraints: [NSLayoutConstraint] = [
            tableView.topAnchor.constraint(equalTo: labelHeading.bottomAnchor,constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(labelConstraints + tableViewConstraints)
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalModel.animals.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.animalLabel.text = animalModel.animals[indexPath.row]
        cell.animalImageView.image = UIImage(named: animalModel.animalImages[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = AnimalDetailViewController()
        detailVc.animalDetails.text  = animalModel.animalDetails[indexPath.row]
        detailVc.animalImage.image = UIImage(named: animalModel.animalImages[indexPath.row])
        present(detailVc, animated: true,completion: nil)
    }
  
    
    
}



