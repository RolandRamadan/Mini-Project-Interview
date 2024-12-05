//
//  HomeViewController.swift
//  Mini-Project-Interview
//
//  Created by Roland Ramadan on 02/12/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let menuData = ["1", "2", "3", "4", "6", "7", "8", "9"]
    private let filterTagData = ["Indian", "Chinese", "Japanese", "French", "Moroccan"]
    
    private lazy var tagHScrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .red
        
        return view
    }()
    
    private lazy var scrollHStackContent: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        stack.backgroundColor = .blue
 
        return stack
    }()
    
    private lazy var testLabel: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var MenuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .secondarySystemBackground
        
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addItemsToScrollView()
        setup()
    }
    
}

extension HomeViewController {
    func setup(){
        self.view.backgroundColor = .secondarySystemBackground
        self.navigationItem.title = "Choose Your Menu"
        self.navigationItem.searchController = UISearchController()
        
        view.addSubview(tagHScrollView)
        view.addSubview(testLabel)
        tagHScrollView.addSubview(scrollHStackContent)
        view.addSubview(MenuCollectionView)
        
        MenuCollectionView.delegate = self
        MenuCollectionView.dataSource = self
        MenuCollectionView.register(MenuCard.self, forCellWithReuseIdentifier: "menu")
        
        configureAutoLayout()
        
        func configureAutoLayout(){
            NSLayoutConstraint.activate([
                tagHScrollView.topAnchor.constraint(equalTo: view.topAnchor),
                tagHScrollView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
                tagHScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                tagHScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                
                
                scrollHStackContent.leadingAnchor.constraint(equalTo: tagHScrollView.leadingAnchor),
                scrollHStackContent.trailingAnchor.constraint(equalTo: tagHScrollView.trailingAnchor),
//                scrollHStackContent.topAnchor.constraint(equalTo: tagHScrollView.topAnchor),
//                scrollHStackContent.bottomAnchor.constraint(equalTo: tagHScrollView.bottomAnchor),
                
                testLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                testLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                testLabel.topAnchor.constraint(equalTo: tagHScrollView.bottomAnchor),
                
                
                
//                MenuCollectionView.topAnchor.constraint(equalTo: tagHScrollView.bottomAnchor),
//                MenuCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//                MenuCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
//                MenuCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menu", for: indexPath) as! MenuCard
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2 - 15, height: view.frame.height * 0.3)
    }
}

extension HomeViewController{
    private func addItemsToScrollView() {
        for (_, text) in filterTagData.enumerated() {
            let filterTag = FilterTag()
            filterTag.backgroundColor = .systemBackground
            filterTag.translatesAutoresizingMaskIntoConstraints = false
            filterTag.label.text = text
            scrollHStackContent.addArrangedSubview(filterTag)
        }
    }
}
