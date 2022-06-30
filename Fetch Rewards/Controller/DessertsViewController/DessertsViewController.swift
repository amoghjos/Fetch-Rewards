//
//  ViewController.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/14/22.
//

import UIKit

class DessertsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var mealsModelController = MealsModelController()
    var desserts = [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealsModelController.getMeals(for: .dessert, completion: {
            self.desserts = $0
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
}

//TODO: To allow for more testability, consider subclassing UITableViewDataSource and use one to one design pattern for passing desserts array
extension DessertsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return desserts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dessertCell = tableView.dequeueReusableCell(
            withIdentifier: K.Identifiers.dessetTableViewCell) as? DessetTableViewCell else {
            return UITableViewCell()
        }
        
        let dessert = desserts[indexPath.row]
        dessertCell.setUp(from: dessert)
        
        return dessertCell
    }
}
