//
//  WeightLossViewController.swift
//  FitnessArena
//
//  Created by akshay on 2022-01-18.
//

import UIKit

class WeightLossViewController: UIViewController {
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var breakfastBtn: UIButton!
    @IBOutlet weak var amSnack: UIButton!
    @IBOutlet weak var lunchBtn: UIButton!
    @IBOutlet weak var pmSnack: UIButton!
    @IBOutlet weak var DinnerBtn: UIButton!
    @IBOutlet weak var ifBtn: UIButton!
    
    var category = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backBtn.setTitle("", for: .normal)
        breakfastBtn.titleLabel?.font = UIFont(name: "...", size: 38 )
        amSnack.titleLabel?.font = UIFont(name: "...", size: 38 )
        lunchBtn.titleLabel?.font = UIFont(name: "...", size: 38 )
        pmSnack.titleLabel?.font = UIFont(name: "...", size: 38 )
        DinnerBtn.titleLabel?.font = UIFont(name: "...", size: 38 )
        ifBtn.titleLabel?.font = UIFont(name: "...", size: 38 )
        
        
        breakfastBtn.layer.cornerRadius = 20.0
        amSnack.layer.cornerRadius = 20.0
        lunchBtn.layer.cornerRadius = 20.0
        pmSnack.layer.cornerRadius = 20.0
        DinnerBtn.layer.cornerRadius = 20.0
        ifBtn.layer.cornerRadius = 20.0

        // Do any additional setup after loading the view.
    }
    
    class func identifier() -> WeightLossViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WeightLossViewController") as! WeightLossViewController
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.popVC()
    }
    
    @IBAction func bfBtnTaped(_ sender: Any) {
        let vc = BreakfastViewController.identifier()
        vc.foodType = WLFoodType.Breakfast
        vc.category = self.category
        vc.subCategory = "Breakfast"
        self.push(vc: vc)
    }
    
    @IBAction func amSnackBtnTapped(_ sender: Any) {
        let vc = BreakfastViewController.identifier()
        vc.foodType = WLFoodType.AMSnack
        vc.category = self.category
        vc.subCategory = "AMSnack"
        self.push(vc: vc)
    }
    
    @IBAction func lunchBtnTapped(_ sender: Any) {
        let vc = BreakfastViewController.identifier()
        vc.foodType = WLFoodType.Lunch
        vc.category = self.category
        vc.subCategory = "Lunch"
        self.push(vc: vc)
    }
    
    @IBAction func pmSnackBtnTapped(_ sender: Any) {
        let vc = BreakfastViewController.identifier()
        vc.foodType = WLFoodType.PMSnack
        vc.category = self.category
        vc.subCategory = "PMSnack"
        self.push(vc: vc)
    }
    
    @IBAction func dineerBtnTapped(_ sender: Any) {
        let vc = BreakfastViewController.identifier()
        vc.foodType = WLFoodType.Dinner
        vc.category = self.category
        vc.subCategory = "Dinner"
        self.push(vc: vc)
    }
    
    @IBAction func ifBtnTapped(_ sender: Any) {
        let vc = IntermittentFastingViewController.identifier()
        self.push(vc: vc)
    }
    
}
