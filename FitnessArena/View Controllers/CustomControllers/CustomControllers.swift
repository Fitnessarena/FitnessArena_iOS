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
    
    var weekDay : Utilities.WeekDays = .Sun
    
    @IBOutlet weak var btnWeekDays: UISegmentedControl!
    
    @IBOutlet weak var btnWeekDaysHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerTableViewCells()
        self.backBtn.setTitle("", for: .normal)
        self.addCustoms.setTitle("", for: .normal)
        self.btnWeekDays.isHidden = true
        self.btnWeekDaysHeight.constant = 0
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
            let placeRef = self.ref.child("users").child("\(userID ?? "")").child("customs").child("Nutritions").child("\(self.weekDay)")
            
            placeRef.observeSingleEvent(of: .value, with: { snapshot in
                
                var tempArr : [Customs] = []
                
                if snapshot.childrenCount > 0 {
                    for child in snapshot.children {
                        let snap = child as! DataSnapshot
                        let placeDict = snap.value as! [String: Any]
                        
                        if let customs: Customs = Mapper<Customs>().map(JSON: placeDict) {
                            tempArr.append(customs)
                        }
                    }
                    
                    //SORT DATA
                    self.arrCustoms = tempArr.sorted {
                        $0.foodCategory! < $1.foodCategory!
                    }
                    
                    //self.arrCustoms = self.arrCustoms.reversed()
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
                
                var tempArr : [Favourite] = []
                
                if snapshot.childrenCount > 0 {
                    for child in snapshot.children {
                        let snap = child as! DataSnapshot
                        let placeDict = snap.value as! [String: Any]
                        
                        if let favourite: Favourite = Mapper<Favourite>().map(JSON: placeDict) {
                            tempArr.append(favourite)
                        }
                    }
                    
                    //SORT DATA
                    self.arrFavourites = tempArr.sorted {
                        $0.subCategory! < $1.subCategory!
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
            vc.weekDay = self.weekDay
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
        
        if sender.selectedSegmentIndex == 0 {
            self.btnWeekDays.isHidden = true
            self.btnWeekDaysHeight.constant = 0
        } else {
            self.btnWeekDays.isHidden = false
            self.btnWeekDaysHeight.constant = 56
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
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            if self.segmentedControl.selectedSegmentIndex == 0 {
//                self.removeCustomWeights(indexId: self.arrFavourites[indexPath.row].id)
//            } else {
//                self.removeCustomNutrition(indexId: self.arrCustoms[indexPath.row].id)
//            }
//        }
//    }
    
    func tableView(_ tableView: UITableView,
                       trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        if self.segmentedControl.selectedSegmentIndex == 0 {
            
            // Write action code for the trash
            let TrashAction = UIContextualAction(style: .normal, title:  "Delete", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                print("Update action ...")
                self.removeCustomWeights(indexId: self.arrFavourites[indexPath.row].id)
                success(true)
            })
            TrashAction.backgroundColor = .red
            
            return UISwipeActionsConfiguration(actions: [TrashAction])
        } else {
            
            // Write action code for the trash
            let TrashAction = UIContextualAction(style: .normal, title:  "Delete", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                print("Update action ...")
                self.removeCustomNutrition(indexId: self.arrCustoms[indexPath.row].id)
                success(true)
            })
            TrashAction.backgroundColor = .red
            
            // Write action code for the Flag
            let ShareAction = UIContextualAction(style: .normal, title:  "Share", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                print("Share action ...")
                
                let text = "I consumed \(self.arrCustoms[indexPath.row].foodName ?? "") for \(self.arrCustoms[indexPath.row].foodCategory ?? ""). It was of \(self.arrCustoms[indexPath.row].foodCalories ?? "") calories."
                
                let myWebsite = NSURL(string:"https://apps.apple.com/tt/app/fitness-arena/id1607786727")
                
                let shareAll = [text , myWebsite!] as [Any]
                let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
                activityViewController.popoverPresentationController?.sourceView = self.view
                self.present(activityViewController, animated: true, completion: nil)
                
                success(true)
            })
            ShareAction.backgroundColor = .brown
            
            return UISwipeActionsConfiguration(actions: [TrashAction,ShareAction])
        }
    }
}
