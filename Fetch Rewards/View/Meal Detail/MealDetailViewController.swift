//
//  MealDetailViewController.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 1/23/23.
//

import UIKit

class MealDetailViewController: UIViewController {

    var mealID: Int?
    
    // UI Elements
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
        
    private lazy var instructionsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Instructions"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 32)
        label.textColor = .label
        return label
    }()
    
    private lazy var instructionDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .label
        return label
    }()
    
    // Initializers
    init(with mealID: Int) {
        super.init(nibName: nil, bundle: nil)
        self.mealID = mealID
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //UI Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setUpScrollView()
        setUpInstructions()
        
        guard let mealID = mealID else { return }
        loadMealDetails(for: mealID)
    }
    
    private func setUpScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        scrollView.addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
    }
    
    private func setUpInstructions() {
        contentView.addSubview(instructionsLabel)
        NSLayoutConstraint.activate([
            instructionsLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            instructionsLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            instructionsLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        contentView.addSubview(instructionDescription)
        NSLayoutConstraint.activate([
            instructionDescription.topAnchor.constraint(equalTo: instructionsLabel.bottomAnchor),
            instructionDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            instructionDescription.widthAnchor.constraint(equalTo: instructionsLabel.widthAnchor),
            instructionDescription.centerXAnchor.constraint(equalTo: instructionsLabel.centerXAnchor)
        ])
    }
    
    // Helper
    private func loadMealDetails(for mealID: Int) {
        MealsModelController().getMealDetail(for: mealID) { mealDetail in
            DispatchQueue.main.async {
                self.title = mealDetail.name
                self.instructionDescription.text = mealDetail.instructions
            }
        }
    }
}
