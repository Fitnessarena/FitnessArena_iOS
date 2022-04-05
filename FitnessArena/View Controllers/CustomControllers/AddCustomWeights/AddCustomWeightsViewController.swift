//
//  AddCustomWeightsViewController.swift
//  FitnessArena
//
//  Created by Akshay on 2022-02-17.
//

import UIKit
import Firebase
import ObjectMapper
import FirebaseAnalytics

class AddCustomWeightsViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var weightsText: UITextField!
    @IBOutlet weak var repititionsText: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var btnWeekDays: UISegmentedControl!
    
    var weekDay : Utilities.WeekDays = .Sun
    
    let ref = Database.database().reference()
    
    var arrCustoms : [Customs] = []
    var updateCustoms : Customs = Customs()
    var favourite = Favourite()
    var isEditModeOn : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.registerTableViewCells()
        
        self.backBtn.setTitle("", for: .normal)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getCustomWeights()
    }
    
    class func identifier() -> AddCustomWeightsViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddCustomWeightsViewController") as! AddCustomWeightsViewController
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.popVC()
    }

    
    func registerTableViewCells() {
        let addCustomWeightsTableViewCell = UINib(nibName: "AddCustomWeightsTableViewCell", bundle: nil)
        self.tableView.register(addCustomWeightsTableViewCell, forCellReuseIdentifier: "AddCustomWeightsTableViewCell")
    }
    
    func getCustomWeights() {
        self.arrCustoms.removeAll()
        let userID = UserDefaults.standard.value(forKey: "loggedInUserID")
        
        if userID != nil {
            let placeRef = self.ref.child("users").child("\(userID ?? "")").child("customs").child("Weights").child("\(self.favourite.id ?? "")").child("\(weekDay)").child("arrData")
            
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
    
    func updateCustomWeights() {
        self.view.endEditing(true)
        let userID = UserDefaults.standard.value(forKey: "loggedInUserID")
        self.ref.child("users").child("\(userID ?? "")").child("customs").child("Weights").child("\(self.favourite.id ?? "")").child("\(self.weekDay)").child("arrData").child("\(self.updateCustoms.id ?? "")").updateChildValues([
            "id": "\(self.updateCustoms.id ?? "")",
            "title" : self.favourite.title!,
            "desc": self.favourite.desc!,
            "imageName": self.favourite.imageName!,
            "category": self.favourite.category!,
            "subCategory": self.favourite.subCategory!,
            "weights": self.weightsText.text!,
            "repititions": self.repititionsText.text!,
            "weekDay": "\(self.weekDay)"
        ])
        
        
        //FIREBASE ANALYTICS 
        let param = [AnalyticsParameterScreenName: "AddCustomWeightsViewController", "user_id" : "\(userID ?? "")", "Weight_Category": "\(self.favourite.category!)", "Weight_SubCategory": "\(self.favourite.subCategory!)"]
        print("AnalyticsParameterScreenName Param : \(param)")
        Analytics.logEvent("CustomWeightUpdated", parameters: param)
        
        self.giveAlertToUser(message: "Successfully updated.")
        self.getCustomWeights()
        self.isEditModeOn = false
        self.weightsText.text = ""
        self.repititionsText.text = ""
    }
    
    func addToCustomWeights() {
        self.view.endEditing(true)
        let userID = UserDefaults.standard.value(forKey: "loggedInUserID")
        let timestamp = Int(NSDate().timeIntervalSince1970)
        self.ref.child("users").child("\(userID ?? "")").child("customs").child("Weights").child("\(self.favourite.id ?? "")").child("\(self.weekDay)").child("arrData").child("\(timestamp)").setValue([
            "id": "\(timestamp)",
            "title" : self.favourite.title!,
            "desc": self.favourite.desc!,
            "imageName": self.favourite.imageName!,
            "category": self.favourite.category!,
            "subCategory": self.favourite.subCategory!,
            "weights": self.weightsText.text!,
            "repititions": self.repititionsText.text!,
            
        ])
        
        let param = [AnalyticsParameterScreenName: "AddCustomWeightsViewController", "user_id" : "\(userID ?? "")", "Weight_Category": "\(self.favourite.category!)", "Weight_SubCategory": "\(self.favourite.subCategory!)"]
        print("AnalyticsParameterScreenName Param : \(param)")
        Analytics.logEvent("CustomWeightAdded", parameters: param)
        
        self.giveAlertToUser(message: "Successfully added to customs.")
        self.getCustomWeights()
    }
    
    func removeCustomWeights(indexId: Int) {
        
        if self.favourite.id != nil {
            let userID = UserDefaults.standard.value(forKey: "loggedInUserID")
            self.ref.child("users").child("\(userID ?? "")").child("customs").child("Weights").child("\(self.favourite.id ?? "")").child("arrData").child("\(self.arrCustoms[indexId].id ?? "")").removeValue()
            let alert = UIAlertController(title: "Success", message: "Successfully removed from favourites.", preferredStyle: UIAlertController.Style.alert)
            
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { action in
                // do something like...
                self.getCustomWeights()
            }))
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        
        if self.weightsText.text?.trimmingCharacters(in: .whitespaces) != "" && self.repititionsText.text?.trimmingCharacters(in: .whitespaces) != "" {
            
            if self.isEditModeOn {
                //UPDATE DATA
                self.updateCustomWeights()
            } else {
                //ADD NEW DATA
                self.addToCustomWeights()
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
        
        self.getCustomWeights()
    }
    
}

extension AddCustomWeightsViewController : UITableViewDelegate, UITableViewDataSource {
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            self.removeCustomWeights(indexId: indexPath.row)
//        }
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrCustoms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddCustomWeightsTableViewCell") as! AddCustomWeightsTableViewCell
        cell.lblText?.text = "\(self.arrCustoms[indexPath.row].weights ?? "") kg * \(self.arrCustoms[indexPath.row].repititions ?? "") reps"
        
        
        let a = Double(self.arrCustoms[indexPath.row].id ?? "") ?? 0.0
        let myDate = NSDate(timeIntervalSince1970: a)
        print(myDate)
    
        let format = DateFormatter()
        format.dateFormat = "MMM-dd-yyyy, HH:mm a"
        let timestamp = format.string(from: myDate as Date)
        
        cell.lblDateTime?.text = timestamp
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                       trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        // Write action code for the trash
        let TrashAction = UIContextualAction(style: .normal, title:  "Delete", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print("Update action ...")
            self.removeCustomWeights(indexId: indexPath.row)
            success(true)
        })
        TrashAction.backgroundColor = .red
        
        // Write action code for the Flag
        let EditAction = UIContextualAction(style: .normal, title:  "Edit", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print("Update action ...")
            
            self.weightsText.text = self.arrCustoms[indexPath.row].weights
            self.repititionsText.text = self.arrCustoms[indexPath.row].repititions
            self.updateCustoms = self.arrCustoms[indexPath.row]
            self.isEditModeOn = true
            success(true)
        })
        EditAction.backgroundColor = .blue
        
        // Write action code for the Flag
        let ShareAction = UIContextualAction(style: .normal, title:  "Share", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            print("Share action ...")
            
            let text = "Checkout my achievement for \(self.favourite.title ?? ""). I completed \(self.arrCustoms[indexPath.row].repititions ?? "") reps of \(self.arrCustoms[indexPath.row].weights ?? "") kg(s)"
            let image = UIImage(named: "\(self.favourite.imageName ?? "AppIcon")")
            let myWebsite = NSURL(string:"https://apps.apple.com/tt/app/fitness-arena/id1607786727")
            let shareAll = [text , image! , myWebsite!] as [Any]
            let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
            
            success(true)
        })
        ShareAction.backgroundColor = .brown
        
        return UISwipeActionsConfiguration(actions: [TrashAction,EditAction,ShareAction])
    }
    
}

