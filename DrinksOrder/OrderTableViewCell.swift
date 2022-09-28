//
//  OrderTableViewCell.swift
//  DrinksOrder
//
//  Created by Jemiway on 2022/9/28.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var pearlLabel: UILabel!
    
    @IBOutlet var cupSizeLabel: UILabel!
    @IBOutlet var sugarLabel: UILabel!
    
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var drinkNameLabel: UILabel!
    @IBOutlet var orderNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
