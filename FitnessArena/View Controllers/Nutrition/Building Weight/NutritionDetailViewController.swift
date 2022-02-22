//
//  NutritionDetailViewController.swift
//  FitnessArena
//
//  Created by Akshay on 2021-12-14.
//

import UIKit

class NutritionDetailViewController: UIViewController {

    @IBOutlet weak var nutritionLabel: UILabel!
    @IBOutlet weak var nutritionDetails: UITextView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var homelabel: UIButton!
    
    var nutritionName = ""
    var nutritiondetails = ""
    
    var arrName : [String] = []
    var arrDetails : [String] = []
    var index = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backButton.setTitle("", for: .normal)
        self.homelabel.setTitle("", for: .normal)

        self.nutritionLabel.text = self.arrName[index]
        self.nutritionDetails.text = self.arrDetails[index]
        
        nutritionLabel.font = nutritionLabel.font.withSize(38)
        nutritionDetails.font = nutritionDetails.font?.withSize(16)
    }
    
    class func identifier() -> NutritionDetailViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NutritionDetailViewController") as! NutritionDetailViewController
    }
    
    @IBAction func nutritionBackTapped(_ sender: Any) {
        self.popVC()
    }
    
    @IBAction func homeButtonTapped(_ sender: Any) {
        self.popToSpecificController(vc: HomeViewController.self)
    }
    

}
