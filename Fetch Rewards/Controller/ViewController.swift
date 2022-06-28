//
//  ViewController.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/14/22.
//

import UIKit

class ViewController: UIViewController {
    
    var mealsModelController = MealsModelController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return tableView.dequeueReusableCell(withIdentifier: "DessetCell")!
    }
}

