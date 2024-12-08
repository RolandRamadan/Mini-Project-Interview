//
//  MenuDetailViewController.swift
//  Mini-Project-Interview
//
//  Created by Roland Ramadan on 08/12/24.
//

import UIKit
import SafariServices

class MenuDetailViewController: UIViewController {
    var meal: Meal?
    
    private lazy var image: UIImageView = {
        let view = UIImageView()
        view.downloaded(from: self.meal?.strMealThumb ?? "")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        
        return view
    }()
    
    private lazy var filterTag: FilterTag = FilterTag()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var contentVStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 10
        
        return view
    }()
    
    private lazy var descVStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 10
        
        return view
    }()
    
    private lazy var ingredientVStack: UIStackView = {
        let content = UIStackView()
        content.axis = .vertical
        content.translatesAutoresizingMaskIntoConstraints = false
        content.distribution = .equalSpacing
        
        let title = UILabel()
        title.text = "Ingredients"
        title.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .headline).pointSize, weight: .bold)
        content.addArrangedSubview(title)
        
        return content
    }()
    
    private lazy var instructionVStack: UIStackView = {
        let content = UIStackView()
        content.axis = .vertical
        content.translatesAutoresizingMaskIntoConstraints = false
        content.distribution = .equalSpacing
        
        let title = UILabel()
        title.text = "Instructions"
        title.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .headline).pointSize, weight: .bold)
        content.addArrangedSubview(title)
        
        return content
    }()
    
    private lazy var youtubeStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 5
        
        let title = UILabel()
        title.text = "Available On The Youtube"
        title.font = UIFont.systemFont(ofSize: UIFont.preferredFont(forTextStyle: .headline).pointSize, weight: .bold)
        view.addArrangedSubview(title)
        
        let image = UIImageView()
        let src = UIImage(named: "youtubeLogo")
        image.image = src
        image.contentMode = .scaleAspectFit

        view.addArrangedSubview(image)
        
        return view
    }()
    
    
    init(meal: Meal?) {
        super.init(nibName: nil, bundle: nil)
        self.meal = meal
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadPageData()
    }
    
}
extension MenuDetailViewController{
    
    func setup(){
        navigationItem.title = meal?.strMeal
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        
        scrollView.addSubview(image)
        scrollView.addSubview(descVStack)
        filterTag.label.text = meal?.strCategory
        scrollView.addSubview(filterTag)
        
        descVStack.addArrangedSubview(ingredientVStack)
        descVStack.addArrangedSubview(instructionVStack)
        descVStack.addArrangedSubview(youtubeStack)
        
        configureAutoLayout()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(goToYoutube))
        youtubeStack.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func configureAutoLayout(){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            image.topAnchor.constraint(equalTo: scrollView.topAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            image.heightAnchor.constraint(equalTo: image.widthAnchor, multiplier: 1),
            
            filterTag.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            filterTag.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            filterTag.bottomAnchor.constraint(equalTo: descVStack.topAnchor,constant: -10),
            
            descVStack.topAnchor.constraint(equalTo: filterTag.bottomAnchor, constant: 16),
            descVStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descVStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            descVStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0)
            
        ])
    }
}

extension MenuDetailViewController{
    private func loadPageData(){
        addItemsToScrollView()
        addInstruction()
    }
    
    private func addInstruction(){
        let label = UILabel()
        label.text = meal?.strInstructions
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.lineBreakMode = .byWordWrapping
        instructionVStack.addArrangedSubview(label)
    }
    
    private func addItemsToScrollView() {
        let ingredients = [ meal?.strIngredient1
                            ,meal?.strIngredient2
                            ,meal?.strIngredient3
                            ,meal?.strIngredient4
                            ,meal?.strIngredient5
                            ,meal?.strIngredient6
                            ,meal?.strIngredient7
                            ,meal?.strIngredient8
                            ,meal?.strIngredient9
                            , meal?.strIngredient10
                            , meal?.strIngredient11
                            , meal?.strIngredient12
                            , meal?.strIngredient13
                            , meal?.strIngredient14
                            , meal?.strIngredient15
                            , meal?.strIngredient16
                            , meal?.strIngredient17
                            , meal?.strIngredient18
                            , meal?.strIngredient19
                            , meal?.strIngredient20
        ]
        
        let measurements = [meal?.strMeasure1
                            ,meal?.strMeasure2
                            ,meal?.strMeasure3
                            ,meal?.strMeasure4
                            ,meal?.strMeasure5
                            ,meal?.strMeasure6
                            ,meal?.strMeasure7
                            ,meal?.strMeasure8
                            ,meal?.strMeasure9
                            ,meal?.strMeasure10
                            ,meal?.strMeasure11
                            ,meal?.strMeasure12
                            ,meal?.strMeasure13
                            ,meal?.strMeasure14
                            ,meal?.strMeasure15
                            ,meal?.strMeasure16
                            ,meal?.strMeasure17
                            ,meal?.strMeasure18
                            ,meal?.strMeasure19
                            ,meal?.strMeasure20
        ]
        
        for (idx, item) in measurements.enumerated() {
            if item == nil {
                break
            }
            if item == "" || item == " "{
                break
            }
            let label = UILabel()
            label.text = "\(item ?? "") \(ingredients[idx] ?? "")"
            label.translatesAutoresizingMaskIntoConstraints = false
            ingredientVStack.addArrangedSubview(label)
        }
    }
    @objc func goToYoutube() {
        guard let url = URL(string: meal?.strYoutube ?? "google.com") else {return}
        let vc = SFSafariViewController(url: url)
        
        self.present(vc, animated: true)
    }
}
