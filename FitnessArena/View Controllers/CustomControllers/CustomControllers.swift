//
//  CustomControllers.swift
//  FitnessArena
//
//  Created by Akshay on 2022-02-17.
//

import UIKit
import Firebase
import ObjectMapper

class CustomControllers: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var addCustoms: UIButton!
    
    var arrFavourites : [Favourite] = []
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backBtn.setTitle("", for: .normal)
        self.addCustoms.setTitle("", for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.calApi()
    }
    
    class func identifier() -> CustomControllers {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomControllers") as! CustomControllers
    }

    func getCustomValues(val: String) {
        self.arrFavourites.removeAll()
        self.arrFavourites = []
        self.tableView.reloadData()
        let userID = UserDefaults.standard.value(forKey: "loggedInUserID")
        
        if userID != nil {
            let placeRef = self.ref.child("users").child("\(userID ?? "")").child("customs").child("\(val)")
            
            placeRef.observeSingleEvent(of: .value, with: { snapshot in
                
                if snapshot.childrenCount > 0 {
                    for child in snapshot.children {
                        let snap = child as! DataSnapshot
                        let placeDict = snap.value as! [String: Any]
                        
                        if let favourite: Favourite = Mapper<Favourite>().map(JSON: placeDict) {
                            self.arrFavourites.append(favourite)
                        }
                    }
                    self.tableView.reloadData()
                } else {
                    self.tableView.reloadData()
                }
            })
        }
        self.tableView.reloadData()
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.popVC()
    }
    
    func calApi() {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            self.getCustomValues(val: "Weights")
        case 1:
            self.getCustomValues(val: "Nutrition")
        default:
            break
        }
    }
    
    @IBAction func addCustomsTapped(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            let vc = WeightsViewController.identifier()
            vc.category = "Weights"
            vc.isFromCustomsController = true
            self.push(vc: vc)
        case 1:
            let vc = NutritionViewController.identifier()
            vc.category = "Nutrition"
            self.push(vc: vc)
        default:
            break
        }
    }
    
    @IBAction func segmentedButtonAction(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        self.calApi()
    }
    
}

extension CustomControllers : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "AddCustomWeightsViewController") as? AddCustomWeightsViewController {
            vc.favourite = self.arrFavourites[indexPath.row]
            self.push(vc: vc)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrFavourites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteTableViewCell") as! FavouriteTableViewCell
        cell.lbl?.text = self.arrFavourites[indexPath.row].title
        cell.lblCategory.text = self.arrFavourites[indexPath.row].subCategory
        cell.img?.image = UIImage(named: self.arrFavourites[indexPath.row].imageName ?? "")
        return cell
    }
}
