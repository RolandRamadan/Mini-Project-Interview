//
//  MenuCard.swift
//  Mini-Project-Interview
//
//  Created by Roland Ramadan on 03/12/24.
//

import UIKit

class MenuCard: UICollectionViewCell {
    
    var meal: Meal? {
        didSet{
            setUIData(
                title: meal?.strMeal,
                tag: meal?.strCategory,
                Image: meal?.strMealThumb
            )
        }
    }
    
    private lazy var descriptionVStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .leading
        
        return stack
    }()
    
    private lazy var cardImage: UIImageView = {
        let image = UIImage(systemName: "photo")
        let view = UIImageView(image: image)
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
            
        return view
    }()
    
    private lazy var cardTitle: UILabel = {
        let label = UILabel()
        label.text = "Placeholder Title"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        
        return label
    }()
    
    private lazy var cardTag: FilterTag = {
        let card = FilterTag()
        card.label.text = "Placeholder Tag"
        
        return card
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MenuCard{
    func setup(){
        self.backgroundColor = .systemBackground
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
        descriptionVStack.addArrangedSubview(cardTitle)
        descriptionVStack.addArrangedSubview(cardTag)
    
        self.addSubview(cardImage)
        self.addSubview(descriptionVStack)
        
        configureAutoLayout()
    }
    
    func configureAutoLayout(){
        NSLayoutConstraint.activate([
            descriptionVStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            descriptionVStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            descriptionVStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            cardImage.topAnchor.constraint(equalTo: self.topAnchor, constant: -10),
            cardImage.heightAnchor.constraint(equalToConstant: 200),
            cardImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cardImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}

extension MenuCard{
    func setUIData(title: String?, tag: String?, Image: String?){
        cardTitle.text = title
        cardTag.label.text = tag
        cardImage.downloaded(from: Image ?? "")
    }
}
