//
//  IngredientTableViewCell.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 1/24/23.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {
    private lazy var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    private lazy var subTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    func setUp(with ingredient: Ingredient) {
        title.text = ingredient.name
        subTitle.text = ingredient.quantity
//        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(title)
        NSLayoutConstraint.activate([
            title.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            title.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            title.topAnchor.constraint(equalTo: topAnchor, constant: 10)])
        
        addSubview(subTitle)
        NSLayoutConstraint.activate([
            subTitle.leftAnchor.constraint(equalTo: title.leftAnchor),
            subTitle.rightAnchor.constraint(equalTo: title.rightAnchor),
            subTitle.topAnchor.constraint(equalTo: title.bottomAnchor),
            subTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
