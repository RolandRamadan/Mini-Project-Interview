//
//  MenuDetailViewController.swift
//  Mini-Project-Interview
//
//  Created by Roland Ramadan on 03/12/24.
//

import UIKit

class MenuDetailViewController: UIViewController {

    private let vstack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .brown
        stack.alignment = .leading
        return stack
    }()
    
    private let label1: UILabel = {
        let label = UILabel()
        label.text = "Hello World"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.backgroundColor = .secondarySystemBackground
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let label2: UILabel = {
        let label = UILabel()
        label.text = "Hello World2"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.backgroundColor = .secondarySystemBackground
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

}

extension MenuDetailViewController{
    func setup(){
        view.backgroundColor = .systemBackground
        
        self.vstack.addArrangedSubview(label1)
        self.vstack.addArrangedSubview(label2)
        
        self.view.addSubview(vstack)
        
        NSLayoutConstraint.activate([
//            label.centerXAnchor.constraint(equalTo: view.centerXAnchor), 
            vstack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            vstack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vstack.trailingAnchor.constraint(equalTo: view.trailingAnchor)

        ])
    }
}
