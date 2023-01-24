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
        return stackView
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

    
    // Helper
    private func loadMealDetails(for mealID: Int) {
        MealsModelController().getMealDetail(for: mealID) { mealDetail in
            DispatchQueue.main.async {
                self.title = mealDetail.name
            }
        }
    }
}
