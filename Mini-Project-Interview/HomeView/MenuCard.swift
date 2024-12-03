//
//  MenuCard.swift
//  Mini-Project-Interview
//
//  Created by Roland Ramadan on 03/12/24.
//

import UIKit

class MenuCard: UIView {
    
    private lazy var cardVStack: UIStackView = {
        let vstack = UIStackView()
        vstack.axis = .vertical
        vstack.alignment = .leading
        vstack.backgroundColor = .systemBackground
        vstack.layer.cornerRadius = 8
        vstack.translatesAutoresizingMaskIntoConstraints = false
        return vstack
    }()
    
    private lazy var descriptionVStack: UIStackView = {
        let vstack = UIStackView()
        vstack.axis = .vertical
        vstack.alignment = .leading
        vstack.backgroundColor = .systemBackground
        vstack.layer.cornerRadius = 8
        vstack.translatesAutoresizingMaskIntoConstraints = false
        
        return vstack
    }()
    
    private lazy var cardImage: UIImageView = {
        let img = UIImage(systemName: "photo")
        let view = UIImageView(image: img)
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UIView = {
        let label = UILabel()
        label.text = "This is title"
        label.textColor = .label
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var tagLabel: UIView = {
        let containerView = UIView()
        containerView.layer.cornerRadius = 8
        
        let label = UILabel()
        label.text = "French"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textAlignment = .center
        label.backgroundColor = .secondarySystemBackground
        label.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(label)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
        ])
        
        return containerView
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
        self.addSubview(self.cardVStack)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        cardVStack.addArrangedSubview(self.cardImage)
        cardVStack.addArrangedSubview(self.titleLabel)
        cardVStack.addArrangedSubview(self.tagLabel)
        
        NSLayoutConstraint.activate([
            cardImage.heightAnchor.constraint(equalTo: self.heightAnchor),
            cardImage.widthAnchor.constraint(equalTo: self.widthAnchor),
            cardVStack.topAnchor.constraint(equalTo: self.topAnchor),
            cardVStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            cardVStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cardVStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}
