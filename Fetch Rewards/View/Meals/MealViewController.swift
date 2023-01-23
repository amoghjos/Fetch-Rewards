//
//  MealsScreen.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 1/23/23.
//

import UIKit

class MealViewController: UIViewController {
    
    var meals: [Meal] = []
    
    lazy private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        view.backgroundColor = .systemBackground
        configureTableView()
        configurMealTableViewCell()
        getMeals()
    }
    
    private func configureNavigationBar() {
        title = "Desserts"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func configurMealTableViewCell() {
        tableView.register(MealTableViewCell.self, forCellReuseIdentifier: K.Identifiers.mealTableViewCell)
    }
    
    private func getMeals(){
        MealsModelController().getMeals(for: .dessert) { meals in
            DispatchQueue.main.async {
                self.meals = meals
                self.tableView.reloadData()
            }
        }
    }
}

extension MealViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let mealTableViewCell = tableView.dequeueReusableCell(withIdentifier: K.Identifiers.mealTableViewCell, for: indexPath) as? MealTableViewCell else { return UITableViewCell() }
        mealTableViewCell.setUp(with: meals[indexPath.row])
        return mealTableViewCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        meals.count
    }
}

extension MealViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
