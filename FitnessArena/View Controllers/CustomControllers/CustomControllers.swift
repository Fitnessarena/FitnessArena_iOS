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
    var arrCustoms : [Customs] = []
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerTableViewCells()
        self.backBtn.setTitle("", for: .normal)
        self.addCustoms.setTitle("", for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.calApi()
    }
    
    class func identifier() -> CustomControllers {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomControllers") as! CustomControllers
    }

    func registerTableViewCells() {
        let favouriteTableViewCell = UINib(nibName: "FavouriteTableViewCell", bundle: nil)
        self.tableView.register(favouriteTableViewCell, forCellReuseIdentifier: "FavouriteTableViewCell")
        
        let addCustomNutritionTableViewCell = UINib(nibName: "AddCustomNutritionTableViewCell", bundle: nil)
        self.tableView.register(addCustomNutritionTableViewCell, forCellReuseIdentifier: "AddCustomNutritionTableViewCell")
    }
    
    func getCustomNutritions() {
        self.arrCustoms.removeAll()
        self.arrFavourites.removeAll()
        let userID = UserDefaults.standard.value(forKey: "loggedInUserID")
        
        if userID != nil {
            let placeRef = self.ref.child("users").child("\(userID ?? "")").child("customs").child("Nutritions")
            
            placeRef.observeSingleEvent(of: .value, with: { snapshot in
                
                if snapshot.childrenCount > 0 {
                    for child in snapshot.children {
                        let snap = child as! DataSnapshot
                        let placeDict = snap.value as! [String: Any]
                        
                        if let customs: Customs = Mapper<Customs>().map(JSON: placeDict) {
                            self.arrCustoms.append(customs)
                        }
                    }
                    self.arrCustoms = self.arrCustoms.reversed()
                    self.tableView.reloadData()
                } else {
                    self.tableView.reloadData()
                }
            })
        }
    }
    
    func getCustomValues(val: String) {
        self.arrCustoms.removeAll()
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
    
    func removeCustomNutrition(indexId: String?) {
        let userID = UserDefaults.standard.value(forKey: "loggedInUserID")
        self.ref.child("users").child("\(userID ?? "")").child("customs").child("Nutritions").child("\(indexId ?? "")").removeValue()
        let alert = UIAlertController(title: "Success", message: "Successfully removed from favourites.", preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { action in
            // do something like...
            self.getCustomNutritions()
        }))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func removeCustomWeights(indexId: String?) {
        let userID = UserDefaults.standard.value(forKey: "loggedInUserID")
        self.ref.child("users").child("\(userID ?? "")").child("customs").child("Weights").child("\(indexId ?? "")").removeValue()
        let alert = UIAlertController(title: "Success", message: "Successfully removed from favourites.", preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { action in
            // do something like...
            self.getCustomValues(val: "Weights")
        }))
        // show the alert
        self.present(alert, animated: true, completion: nil)
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
            self.getCustomNutritions()
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
            let vc = AddCustomNutritionViewController.identifier()
            self.push(vc: vc)
        default:
            break
        }
    }
    
    @IBAction func segmentedButtonAction(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        self.arrCustoms.removeAll()
        self.arrFavourites.removeAll()
        self.tableView.reloadData()
        self.calApi()
    }
    
}

extension CustomControllers : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.segmentedControl.selectedSegmentIndex == 0 {
            return self.arrFavourites.count
        } else {
            return self.arrCustoms.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.segmentedControl.selectedSegmentIndex == 0 {
            //WEIGHTS
            let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteTableViewCell") as! FavouriteTableViewCell
            cell.lbl?.text = self.arrFavourites[indexPath.row].title
            cell.lblCategory.text = self.arrFavourites[indexPath.row].subCategory
            cell.img?.image = UIImage(named: self.arrFavourites[indexPath.row].imageName ?? "")
            return cell
        } else {
            //NUTRITION
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddCustomNutritionTableViewCell") as! AddCustomNutritionTableViewCell
            cell.lblFoodName?.text = self.arrCustoms[indexPath.row].foodName
            cell.lblCalories.text = "Calories: \(self.arrCustoms[indexPath.row].foodCalories ?? "0")"
            cell.lblFoodCategory.text = self.arrCustoms[indexPath.row].foodCategory
            
            let a = Double(self.arrCustoms[indexPath.row].id ?? "") ?? 0.0
            let myDate = NSDate(timeIntervalSince1970: a)
            print(myDate)
        
            let format = DateFormatter()
            format.dateFormat = "MMM-dd-yyyy, HH:mm a"
            let timestamp = format.string(from: myDate as Date)
            
            cell.lblDateTime?.text = timestamp
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.segmentedControl.selectedSegmentIndex == 0 {
            if let vc = storyboard?.instantiateViewController(withIdentifier: "AddCustomWeightsViewController") as? AddCustomWeightsViewController {
                vc.favourite = self.arrFavourites[indexPath.row]
                self.push(vc: vc)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if self.segmentedControl.selectedSegmentIndex == 0 {
                self.removeCustomWeights(indexId: self.arrFavourites[indexPath.row].id)
            } else {
                self.removeCustomNutrition(indexId: self.arrCustoms[indexPath.row].id)
            }
        }
    }
}
