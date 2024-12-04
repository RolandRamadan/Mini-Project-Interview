//
//  FilterCard.swift
//  Mini-Project-Interview
//
//  Created by Roland Ramadan on 04/12/24.
//

import UIKit

class FilterTag: UIView {

    lazy var label = UILabel()
    
    init(frame: CGRect, labelText: String) {
        super.init(frame: frame)
        setup(labelText: labelText)
    }
    
    func setup(labelText: String){
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = labelText
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textAlignment = .center
        
        self.addSubview(label)
        self.backgroundColor = .secondarySystemBackground
        self.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
        configureAutoLayout()
    }
    
    func configureAutoLayout(){
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
