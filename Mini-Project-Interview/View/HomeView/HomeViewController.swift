//
//  HomeViewController.swift
//  Mini-Project-Interview
//
//  Created by Roland Ramadan on 02/12/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var homeVM: HomeViewModel = HomeViewModel()
    private var searchWorkItem: DispatchWorkItem?
    
    private lazy var tagHScrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isScrollEnabled = true
        view.showsHorizontalScrollIndicator = false
        
        return view
    }()
    
    private lazy var scrollHStackContent: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        
        return stack
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
    
    private lazy var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        homeVM.updateMealData(for: "")
        addItemsToScrollView()
        setup()
    }
    
}

private extension HomeViewController {
    func setup(){
        self.view.backgroundColor = .secondarySystemBackground
        self.navigationItem.title = "Choose Your Menu"
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
        view.addSubview(tagHScrollView)
        tagHScrollView.addSubview(scrollHStackContent)
        view.addSubview(MenuCollectionView)
        MenuCollectionView.delegate = self
        MenuCollectionView.dataSource = self
        MenuCollectionView.register(MenuCard.self, forCellWithReuseIdentifier: "menu")
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Meals"
        
        configureAutoLayout()
        
        func configureAutoLayout(){
            NSLayoutConstraint.activate([
                tagHScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                tagHScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                tagHScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                tagHScrollView.heightAnchor.constraint(equalToConstant: 30),
                
                scrollHStackContent.leadingAnchor.constraint(equalTo: tagHScrollView.leadingAnchor),
                scrollHStackContent.trailingAnchor.constraint(equalTo: tagHScrollView.trailingAnchor),
                
                MenuCollectionView.topAnchor.constraint(equalTo: tagHScrollView.bottomAnchor, constant: 10),
                MenuCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                MenuCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                MenuCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let count = homeVM.meals?.count else {return 0}
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menu", for: indexPath) as! MenuCard
        cell.meal = homeVM.meals?[indexPath.item]
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width/2 - 15, height: view.frame.height * 0.3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(MenuDetailViewController(meal: homeVM.meals?[indexPath.item]), animated: true)
    }
}

extension HomeViewController{
    
    
    private func addItemsToScrollView() {
        
        for (_, text) in homeVM.filterTagData.enumerated() {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(setFilter))
            let filterTag = FilterTag()
            filterTag.addGestureRecognizer(tapGestureRecognizer)
            filterTag.backgroundColor = .systemBackground
            filterTag.translatesAutoresizingMaskIntoConstraints = false
            filterTag.label.text = text
            scrollHStackContent.addArrangedSubview(filterTag)
        }
    }
}

extension HomeViewController {
    func bindViewModel() {
        homeVM.onMealsUpdated = { [weak self] in
            self?.MenuCollectionView.reloadData()
        }
    }
}

extension HomeViewController: UISearchBarDelegate, UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
//        searchWorkItem?.cancel()
        
//        let workItem = DispatchWorkItem { [weak self] in
//            guard let self = self else { return }
        let searchText = searchController.searchBar.text ?? ""
        homeVM.updateMealData(for: searchText)
//        }
        
//        searchWorkItem = workItem
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: workItem)
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) { searchBar.resignFirstResponder()
    }
    
    @objc func setFilter() {
//        guard let url = URL(string: meal?.strYoutube ?? "google.com") else {return}
    }
}

