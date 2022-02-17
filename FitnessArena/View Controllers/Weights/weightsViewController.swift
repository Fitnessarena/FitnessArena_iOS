//
//  weightsViewController.swift
//  FitnessArena
//
//  Created by Akshay on 2021-12-14.
//

import UIKit

class WeightsViewController: UIViewController {

    @IBOutlet weak var buttonTxt: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var chestBtn: UIButton!
    @IBOutlet weak var legsBtn: UIButton!
    @IBOutlet weak var shouldersBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var absBtn: UIButton!
    
    var category = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        buttonTxt.titleLabel?.font = UIFont(name: "...", size: 38 )
        chestBtn.titleLabel?.font = UIFont(name: "...", size: 38)
        legsBtn.titleLabel?.font = UIFont(name: "...", size: 38)
        shouldersBtn.titleLabel?.font = UIFont(name: "...", size: 38)
        backBtn.titleLabel?.font = UIFont(name: "...", size: 38)
        absBtn.titleLabel?.font = UIFont(name: "...", size: 38)
        self.backButton.setTitle("", for: .normal)
        
        buttonTxt.layer.cornerRadius = 25.0
        chestBtn.layer.cornerRadius = 25.0
        legsBtn.layer.cornerRadius = 25.0
        shouldersBtn.layer.cornerRadius = 25.0
        backBtn.layer.cornerRadius = 25.0
        absBtn.layer.cornerRadius = 25.0
    }
    
    class func identifier() -> WeightsViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WeightsViewController") as! WeightsViewController
    }
    
    @IBAction func weightsBackBtnTapped(_ sender: Any) {
        self.popVC()
    }
    
    @IBAction func armsButtonTapped(_ sender: Any) {
        let vc = ArmsViewController.identifier()
        vc.category = self.category
        vc.subCategory = "Arms"
        self.push(vc: vc)
    }
    @IBAction func chestButtonTapped(_ sender: Any) {
        let vc = ChestViewController.identifier()
        vc.category = self.category
        vc.subCategory = "Chest"
        self.push(vc: vc)
    }
    @IBAction func legsButtonTapped(_ sender: Any) {
        let vc = LegsViewController.identifier()
        vc.category = self.category
        vc.subCategory = "Legs"
        self.push(vc: vc)
    }
    @IBAction func shouldersButtonTapped(_ sender: Any) {
        let vc = ShouldersViewController.identifier()
        vc.category = self.category
        vc.subCategory = "Shoulders"
        self.push(vc: vc)
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        let vc = BackViewController.identifier()
        vc.category = self.category
        vc.subCategory = "Back"
        self.push(vc: vc)
    }
    @IBAction func absButtonTapped(_ sender: Any) {
        let vc = AbsViewController.identifier()
        vc.category = self.category
        vc.subCategory = "Abdominal"
        self.push(vc: vc)
    }
    
}
