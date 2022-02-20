//
//  AddCustomNutritionTableViewCell.swift
//  FitnessArena
//
//  Created by Akshay on 2022-02-20.
//

import UIKit

class AddCustomNutritionTableViewCell: UITableViewCell {

    @IBOutlet weak var lblFoodName: UILabel!
    @IBOutlet weak var lblFoodCategory: UILabel!
    @IBOutlet weak var lblCalories: UILabel!
    @IBOutlet weak var lblDateTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
