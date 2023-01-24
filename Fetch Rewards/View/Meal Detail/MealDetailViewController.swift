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
    
    private lazy var mealDetailStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        return stackView
    }()
    
    private lazy var instructionsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Instructions InstructionsInstructionsInstructionsInstructionsInstructionsInstructionsInstructionsInstructionsInstructionsInstructionsInstructionsInstructionsInstructionsInstructionsInstructionsInstructionsInstructionsInstructionsInstructionsInstructionsInstructionsInstructionsInstructionsInstructionsInstructionsInstructionsInstructionsInstructions"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 100)
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
        setUpMealDetailStackView()
        
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

    private func setUpMealDetailStackView() {
        contentView.addSubview(mealDetailStackView)
        NSLayoutConstraint.activate([
            mealDetailStackView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            mealDetailStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            mealDetailStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mealDetailStackView.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
        
        mealDetailStackView.addSubview(instructionsLabel)
        NSLayoutConstraint.activate([
            instructionsLabel.topAnchor.constraint(equalTo: mealDetailStackView.topAnchor),
            instructionsLabel.bottomAnchor.constraint(equalTo: mealDetailStackView.bottomAnchor),
            instructionsLabel.leftAnchor.constraint(equalTo: mealDetailStackView.leftAnchor),
            instructionsLabel.rightAnchor.constraint(equalTo: mealDetailStackView.rightAnchor)
        ])
             
               
        
    }
    
    // Helper
    private func loadMealDetails(for mealID: Int) {
        MealsModelController().getMealDetail(for: mealID) { mealDetail in
            DispatchQueue.main.async {
                self.title = mealDetail.name
            }
        }
    }
}
