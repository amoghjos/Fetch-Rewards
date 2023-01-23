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
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var mealName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 32)
        label.textColor = .label
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        heightAnchor.constraint(equalToConstant: 150).isActive = true
        configureImageView()
        configureMealName()
    }
    
    func setUp(with meal: Meal) {
        mealImage.image = meal.image
    }
    
    private func configureImageView() {
        addSubview(mealImage)
        mealImage.image = UIImage(named: "Apam balik")
        NSLayoutConstraint.activate([
            mealImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            mealImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            mealImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            mealImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -10)
        ])
    }
    
    private func configureMealName() {
        mealImage.addSubview(mealName)
        mealName.text = "Hello"
        NSLayoutConstraint.activate([
            mealName.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            mealName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
