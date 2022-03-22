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
    
    var isFromCustomsController : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.backButton.setTitle("", for: .normal)
        
//        buttonTxt.titleLabel?.font = UIFont(name: "...", size: 38 )
//        chestBtn.titleLabel?.font = UIFont(name: "...", size: 38)
//        legsBtn.titleLabel?.font = UIFont(name: "...", size: 38)
//        shouldersBtn.titleLabel?.font = UIFont(name: "...", size: 38)
//        backBtn.titleLabel?.font = UIFont(name: "...", size: 38)
//        absBtn.titleLabel?.font = UIFont(name: "...", size: 38)
//
//        buttonTxt.frame.size.height = 50
//        chestBtn.frame.size.height = 50
//        legsBtn.frame.size.height = 50
//        shouldersBtn.frame.size.height = 50
//        backBtn.frame.size.height = 50
//        absBtn.frame.size.height = 50
//
//        buttonTxt.layer.cornerRadius = buttonTxt.frame.height / 2
//        chestBtn.layer.cornerRadius = buttonTxt.frame.height / 2
//        legsBtn.layer.cornerRadius = buttonTxt.frame.height / 2
//        shouldersBtn.layer.cornerRadius = buttonTxt.frame.height / 2
//        backBtn.layer.cornerRadius = buttonTxt.frame.height / 2
//        absBtn.layer.cornerRadius = buttonTxt.frame.height / 2
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
        vc.isFromCustomsController = self.isFromCustomsController
        self.push(vc: vc)
    }
    @IBAction func chestButtonTapped(_ sender: Any) {
        let vc = ChestViewController.identifier()
        vc.category = self.category
        vc.subCategory = "Chest"
        vc.isFromCustomsController = self.isFromCustomsController
        self.push(vc: vc)
    }
    @IBAction func legsButtonTapped(_ sender: Any) {
        let vc = LegsViewController.identifier()
        vc.category = self.category
        vc.subCategory = "Legs"
        vc.isFromCustomsController = self.isFromCustomsController
        self.push(vc: vc)
    }
    @IBAction func shouldersButtonTapped(_ sender: Any) {
        let vc = ShouldersViewController.identifier()
        vc.category = self.category
        vc.subCategory = "Shoulders"
        vc.isFromCustomsController = self.isFromCustomsController
        self.push(vc: vc)
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        let vc = BackViewController.identifier()
        vc.category = self.category
        vc.subCategory = "Back"
        vc.isFromCustomsController = self.isFromCustomsController
        self.push(vc: vc)
    }
    @IBAction func absButtonTapped(_ sender: Any) {
        let vc = AbsViewController.identifier()
        vc.category = self.category
        vc.subCategory = "Abdominal"
        vc.isFromCustomsController = self.isFromCustomsController
        self.push(vc: vc)
    }
    
}
