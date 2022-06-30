//
//  DessetTableViewCell.swift
//  Fetch Rewards
//
//  Created by Amogh Joshi on 6/30/22.
//

import UIKit

class DessetTableViewCell: UITableViewCell {
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var dessertName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //configure table view cell
        backgroundImage.layer.cornerRadius = 10

    }
}
