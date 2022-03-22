//
//  AddCustomNutritionViewController.swift
//  FitnessArena
//
//  Created by Akshay on 2022-02-20.
//

import UIKit
import Firebase
import ObjectMapper
import IQKeyboardManagerSwift
import IQDropDownTextField

class AddCustomNutritionViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var FoodNameText: UITextField!
    @IBOutlet weak var CaloriesText: UITextField!
    @IBOutlet weak var CategoryText: IQDropDownTextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    var arrCategory = ["Breakfast", "A.M Snack", "Lunch", "P.M. Snack", "Dinner"]
    
    var weekDay : Utilities.WeekDays = .Sun
    
    let ref = Database.database().reference()
    
    var arrCustoms : [Customs] = []
    var favourite = Favourite()
    
    var isEditModeOn : Bool = false
    
    @IBOutlet weak var btnWeekDays: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.registerTableViewCells()
        
        self.backBtn.setTitle("", for: .normal)
        
        CategoryText.isOptionalDropDown = false
        CategoryText.itemList = self.arrCategory
        CategoryText.selectedItem = self.arrCategory[0]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getCustomNutritions()
    }
    
    class func identifier() -> AddCustomNutritionViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddCustomNutritionViewController") as! AddCustomNutritionViewController
    }
    
    func registerTableViewCells() {
        let addCustomNutritionTableViewCell = UINib(nibName: "AddCustomNutritionTableViewCell", bundle: nil)
        self.tableView.register(addCustomNutritionTableViewCell, forCellReuseIdentifier: "AddCustomNutritionTableViewCell")
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.popVC()
    }
    
    func getCustomNutritions() {
        self.arrCustoms.removeAll()
        let userID = UserDefaults.standard.value(forKey: "loggedInUserID")
        
        if userID != nil {
            let placeRef = self.ref.child("users").child("\(userID ?? "")").child("customs").child("Nutritions").child("\(weekDay)")
            
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
        self.tableView.reloadData()
    }
    
    func updateCustomNutrition() {
        let userID = UserDefaults.standard.value(forKey: "loggedInUserID")
        let timestamp = Int(NSDate().timeIntervalSince1970)
        self.ref.child("users").child("\(userID ?? "")").child("customs").child("Nutritions").child("\(weekDay)").child("\(timestamp)").setValue([
            "id": "\(timestamp)",
            "foodName": self.FoodNameText.text!,
            "foodCalories": self.CaloriesText.text!,
            "foodCategory": self.CategoryText.selectedItem!,
            "weekDay": "\(self.weekDay)"
        ])
        
        self.giveAlertToUser(message: "Successfully added to customs.")
        self.getCustomNutritions()
        self.isEditModeOn = false
        self.FoodNameText.text = ""
        self.CaloriesText.text = ""
    }
    
    func addToCustomNutrition() {
        let userID = UserDefaults.standard.value(forKey: "loggedInUserID")
        let timestamp = Int(NSDate().timeIntervalSince1970)
        self.ref.child("users").child("\(userID ?? "")").child("customs").child("Nutritions").child("\(weekDay)").child("\(timestamp)").setValue([
            "id": "\(timestamp)",
            "foodName": self.FoodNameText.text!,
            "foodCalories": self.CaloriesText.text!,
            "foodCategory": self.CategoryText.selectedItem!,
        ])
        
        self.giveAlertToUser(message: "Successfully added to customs.")
        self.getCustomNutritions()
        self.FoodNameText.text = ""
        self.CaloriesText.text = ""
    }
    
    func removeCustomNutrition(indexId: String?) {
        let userID = UserDefaults.standard.value(forKey: "loggedInUserID")
        self.ref.child("users").child("\(userID ?? "")").child("customs").child("Nutritions").child("\(weekDay)").child("\(indexId ?? "")").removeValue()
        let alert = UIAlertController(title: "Success", message: "Successfully removed from favourites.", preferredStyle: UIAlertController.Style.alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { action in
            // do something like...
            self.getCustomNutritions()
        }))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        if self.CategoryText.selectedItem?.count != 0 && self.CaloriesText.text?.trimmingCharacters(in: .whitespaces) != "" && self.FoodNameText.text?.trimmingCharacters(in: .whitespaces) != "" {
            
            if self.isEditModeOn {
                //UPDATE DATA
                self.updateCustomNutrition()
            } else {
                //ADD NEW DATA
                self.addToCustomNutrition()
            }
        }
    }
    
    @IBAction func btnWeekDaysAction(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        if sender.selectedSegmentIndex == 0 {
            self.weekDay = Utilities.WeekDays.Sun
        } else if sender.selectedSegmentIndex == 1 {
            self.weekDay = Utilities.WeekDays.Mon
        }  else if sender.selectedSegmentIndex == 2 {
            self.weekDay = Utilities.WeekDays.Tue
        }  else if sender.selectedSegmentIndex == 3 {
            self.weekDay = Utilities.WeekDays.Wed
        }  else if sender.selectedSegmentIndex == 4 {
            self.weekDay = Utilities.WeekDays.Thu
        }  else if sender.selectedSegmentIndex == 5 {
            self.weekDay = Utilities.WeekDays.Fri
        }  else if sender.selectedSegmentIndex == 0 {
            self.weekDay = Utilities.WeekDays.Sat
        }
        
        self.getCustomNutritions()
    }
    
}

extension AddCustomNutritionViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.removeCustomNutrition(indexId: self.arrCustoms[indexPath.row].id)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrCustoms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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

