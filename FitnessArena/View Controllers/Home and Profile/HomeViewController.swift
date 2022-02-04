//
//  HomeViewController.swift
//  FitnessArena
//
//  Created by Akshay on 2021-12-13.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var profileButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileButton.setTitle("", for: .normal)
        
        // Do any additional setup after loading the view.
    }
    
    class func identifier() -> HomeViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
    }
    
    @IBAction func cardioButtonTapped(_ sender: Any) {
        let vc = CardioViewController.identifier()
        vc.category = "Cardio"
        self.push(vc: vc)
    }
    @IBAction func weightsButtonTapped(_ sender: Any) {
        let vc = WeightsViewController.identifier()
        vc.category = "Weights"
        self.push(vc: vc)
    }
    @IBAction func nutritionButtonTapped(_ sender: Any) {
        let vc = NutriViewController.identifier()
        vc.category = "Nutrition"
        self.push(vc: vc)
    }
    @IBAction func favouritesButtonTapped(_ sender: Any) {
        self.push(vc: FavouritesViewController.identifier())
    }
    @IBAction func customButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "customScreenSegue", sender: nil)
    }
    @IBAction func profileButtonTapped(_ sender: Any) {
        let vc = ProfileViewController.identifier()
        self.push(vc: vc)
    }
    
}
