//
//  NutriViewController.swift
//  FitnessArena
//
//  Created by akshay on 2022-01-18.
//

import UIKit

class NutriViewController: UIViewController {

    @IBOutlet weak var weightLossButton: UIButton!
    @IBOutlet weak var buildingMuscleButton: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    var category = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backBtn.setTitle("", for: .normal)
        weightLossButton.titleLabel?.font = UIFont(name: "...", size: 38 )
        buildingMuscleButton.titleLabel?.font = UIFont(name: "...", size: 38)
        
        
        weightLossButton.layer.cornerRadius = 25.0
        buildingMuscleButton.layer.cornerRadius = 25.0

        // Do any additional setup after loading the view.
    }
    
    class func identifier() -> NutriViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NutriViewController") as! NutriViewController
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.popVC()
    }
    
    @IBAction func weightLossBtnTapped(_ sender: Any) {
        let vc = WeightLossViewController.identifier()
        self.push(vc: vc)
        //self.performSegue(withIdentifier: "weightLoss", sender: nil)
    }
    
    @IBAction func buildingMuscleBtnTapped(_ sender: Any) {
        let vc = BuildingMuscleViewController.identifier()
        self.push(vc: vc)
        //self.performSegue(withIdentifier: "buildingMuscle", sender: nil)
    }
}
