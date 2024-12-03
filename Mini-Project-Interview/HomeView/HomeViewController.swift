//
//  HomeViewController.swift
//  Mini-Project-Interview
//
//  Created by Roland Ramadan on 02/12/24.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var menuCard: MenuCard = {
        let card = MenuCard()
        return card
    }()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setup()
    }

}

extension HomeViewController{
    func setup(){
        self.view.backgroundColor = .secondarySystemBackground
        self.navigationItem.title = "Choose Your Menu"
        self.navigationItem.searchController = UISearchController()
        self.view.addSubview(menuCard)
        
        NSLayoutConstraint.activate([
            menuCard.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            menuCard.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            menuCard.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            menuCard.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3)
        ])
    }
}

