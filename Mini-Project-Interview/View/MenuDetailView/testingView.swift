////
////  MenuDetailViewController.swift
////  Mini-Project-Interview
////
////  Created by Roland Ramadan on 03/12/24.
////
//
//import UIKit
//
//class testingView: UIViewController {
//
//    private let filterTagData = ["Indian", "Chinese", "Japanese", "French", "Moroccan"]
//    private let menuData = ["1", "2", "3", "4", "6", "7", "8", "9"]
//    
//    private lazy var filterCollectionView: UICollectionView = {
//        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(100), heightDimension: .absolute(30)), subitems: [item])
//        let section = NSCollectionLayoutSection(group: group)
//        section.orthogonalScrollingBehavior = .continuous
//        section.interGroupSpacing = 10
//        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
//        let layout = UICollectionViewCompositionalLayout(section: section)
//        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collection.backgroundColor = .red
//        collection.translatesAutoresizingMaskIntoConstraints = false
//        
//        return collection
//    }()
//    
//    private lazy var MenuCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 10
//        layout.minimumInteritemSpacing = 0
//        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collection.backgroundColor = .secondarySystemBackground
//        collection.translatesAutoresizingMaskIntoConstraints = false
//        
//        return collection
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setup()
//    }
//
//}
//
//extension testingView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
//    func setup(){
//        view.backgroundColor = .secondarySystemBackground
//        self.navigationItem.title =  "Menu Detail"
//        self.navigationItem.searchController = UISearchController()
//        
//        view.addSubview(filterCollectionView)
////        view.addSubview(MenuCollectionView)
//        
//        filterCollectionView.delegate = self
//        filterCollectionView.dataSource = self
//        filterCollectionView.register(FilterTag.self, forCellWithReuseIdentifier: "filter")
//        
//        MenuCollectionView.delegate = self
//        MenuCollectionView.dataSource = self
//        MenuCollectionView.register(MenuCard.self, forCellWithReuseIdentifier: "menu")
//        
//        NSLayoutConstraint.activate([
//            filterCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
//            filterCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            filterCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
//            filterCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10),
//            
////            MenuCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
////            MenuCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
////            MenuCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
////            MenuCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
//        ])
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        switch collectionView {
//        case self.MenuCollectionView:
//            return menuData.count
//        default:
//            return filterTagData.count
//        }
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        switch collectionView {
//        case self.MenuCollectionView:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menu", for: indexPath) as! MenuCard
//            
//            return cell
//        default:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filter", for: indexPath) as! FilterTag
//            cell.label.text = filterTagData[indexPath.item]
//            return cell
//        }
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        switch collectionView {
//        case self.MenuCollectionView:
//            return CGSize(width: view.frame.width/2 - 15, height: view.frame.height * 0.3)
//        default:
//            return CGSize(width: 200, height: 100)
//        }
//    }
//}
