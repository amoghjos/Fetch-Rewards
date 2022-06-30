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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DessertsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return tableView.dequeueReusableCell(withIdentifier: "DessetCell")!
    }
}
