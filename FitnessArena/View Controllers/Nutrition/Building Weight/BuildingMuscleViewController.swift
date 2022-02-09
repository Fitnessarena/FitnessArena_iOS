//
//  BuildingMuscleViewController.swift
//  FitnessArena
//
//  Created by akshay on 2022-01-18.
//

import UIKit

class BuildingMuscleViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var breakfastBtn: UIButton!
    @IBOutlet weak var amSnack: UIButton!
    @IBOutlet weak var lunchBtn: UIButton!
    @IBOutlet weak var pmSnack: UIButton!
    @IBOutlet weak var dinnerBtn: UIButton!
    @IBOutlet weak var proteinBtn: UIButton!
    @IBOutlet weak var preWorkout: UIButton!
    @IBOutlet weak var postWorkout: UIButton!
    @IBOutlet weak var preBedSnack: UIButton!
    
    var category = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backBtn.setTitle("", for: .normal)
        breakfastBtn.titleLabel?.font = UIFont(name: "...", size: 38 )
        amSnack.titleLabel?.font = UIFont(name: "...", size: 38 )
        lunchBtn.titleLabel?.font = UIFont(name: "...", size: 38 )
        pmSnack.titleLabel?.font = UIFont(name: "...", size: 38 )
        dinnerBtn.titleLabel?.font = UIFont(name: "...", size: 38 )
        proteinBtn.titleLabel?.font = UIFont(name: "...", size: 38 )
        preWorkout.titleLabel?.font = UIFont(name: "...", size: 38 )
        postWorkout.titleLabel?.font = UIFont(name: "...", size: 38 )
        preBedSnack.titleLabel?.font = UIFont(name: "...", size: 38 )
        
        
        breakfastBtn.layer.cornerRadius = 20.0
        amSnack.layer.cornerRadius = 20.0
        lunchBtn.layer.cornerRadius = 20.0
        pmSnack.layer.cornerRadius = 20.0
        dinnerBtn.layer.cornerRadius = 20.0
        proteinBtn.layer.cornerRadius = 20.0
        preWorkout.layer.cornerRadius = 20.0
        postWorkout.layer.cornerRadius = 20.0
        preBedSnack.layer.cornerRadius = 20.0

        
        
        // Do any additional setup after loading the view.
    }
    
    class func identifier() -> BuildingMuscleViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BuildingMuscleViewController") as! BuildingMuscleViewController
    }
  
    @IBAction func backBtn(_ sender: Any) {
        self.popVC()
    }
    @IBAction func bfBtnTapped(_ sender: Any) {
        let vc = BreakfastBMViewController.identifier()
        vc.foodType = BMFoodType.Breakfast
        vc.category = self.category
        self.push(vc: vc)
    }
    @IBAction func amSnackTapped(_ sender: Any) {
        let vc = BreakfastBMViewController.identifier()
        vc.foodType = BMFoodType.AMSnack
        vc.category = self.category
        self.push(vc: vc)
    }
    @IBAction func lunchBtnTapped(_ sender: Any) {
        let vc = BreakfastBMViewController.identifier()
        vc.foodType = BMFoodType.Lunch
        vc.category = self.category
        self.push(vc: vc)
    }
    
    @IBAction func pmSnackBtnTapped(_ sender: Any) {
        let vc = BreakfastBMViewController.identifier()
        vc.foodType = BMFoodType.PMSnack
        vc.category = self.category
        self.push(vc: vc)
    }
    
    @IBAction func dinnerBtnTapped(_ sender: Any) {
        let vc = BreakfastBMViewController.identifier()
        vc.foodType = BMFoodType.Dinner
        vc.category = self.category
        self.push(vc: vc)
    }
    
    @IBAction func proteinBtnTapped(_ sender: Any) {
        let vc = BreakfastBMViewController.identifier()
        vc.foodType = BMFoodType.Protein
        vc.category = self.category
        self.push(vc: vc)
    }
    
    @IBAction func preWorkoutBtnTapped(_ sender: Any) {
        let vc = BreakfastBMViewController.identifier()
        vc.foodType = BMFoodType.PreWorkout
        vc.category = self.category
        self.push(vc: vc)
    }
    
    @IBAction func postWorkoutBtnTapped(_ sender: Any) {
        let vc = BreakfastBMViewController.identifier()
        vc.foodType = BMFoodType.PostWorkout
        vc.category = self.category
        self.push(vc: vc)
    }
    
    @IBAction func preBedSnackBtnTapped(_ sender: Any) {
        let vc = BreakfastBMViewController.identifier()
        vc.foodType = BMFoodType.PreBedSnack
        vc.category = self.category
        self.push(vc: vc)
    }
    
}
