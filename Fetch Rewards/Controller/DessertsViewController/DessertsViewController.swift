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
    
    //pass the meal of the selected meal
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case K.Identifiers.sendToDessertDetailsViewController:
            guard let destinationVC = segue.destination as? DessertDetailsViewController else { return }
            guard let index = tableView.indexPathForSelectedRow?.row else { return }
            let mealID = desserts[index].id
            destinationVC.mealID = mealID
            #warning("move this result to detail view controller")
            mealsModelController.getMealDetails(for: mealID) { details in
                print(details)
            }
        default:
            break
        }
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

extension DessertsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //reset highlighted table view cell
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
