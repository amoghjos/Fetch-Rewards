//
//  MealTableViewCell.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 1/23/23.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    private lazy var mealImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureImageView()
    }
    
    func setUp(with meal: Meal) {
        mealImage.image = meal.image
    }
    
    private func configureImageView() {
        addSubview(mealImage)
        NSLayoutConstraint.activate([
            mealImage.topAnchor.constraint(equalTo: topAnchor),
            mealImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            mealImage.leftAnchor.constraint(equalTo: leftAnchor),
            mealImage.rightAnchor.constraint(equalTo: rightAnchor),
            mealImage.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
