//
//  AddCustomWeightsViewController.swift
//  FitnessArena
//
//  Created by Akshay on 2022-02-17.
//

import UIKit
import Firebase
import ObjectMapper

class AddCustomWeightsViewController: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var weightsText: UITextField!
    @IBOutlet weak var repititionsText: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    let ref = Database.database().reference()
    
    var arrCustoms : [Customs] = []
    var favourite = Favourite()
    
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
    // Akshay kondapalli
    
    func registerTableViewCells() {
        let addCustomWeightsTableViewCell = UINib(nibName: "AddCustomWeightsTableViewCell", bundle: nil)
        self.tableView.register(addCustomWeightsTableViewCell, forCellReuseIdentifier: "AddCustomWeightsTableViewCell")
    }
    
    func getCustomWeights() {
        self.arrCustoms.removeAll()
        let userID = UserDefaults.standard.value(forKey: "loggedInUserID")
        
        if userID != nil {
            let placeRef = self.ref.child("users").child("\(userID ?? "")").child("customs").child("Weights").child("\(self.favourite.id ?? "")").child("arrData")
            
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
    
    func addToCustomWeights() {
        let userID = UserDefaults.standard.value(forKey: "loggedInUserID")
        let timestamp = Int(NSDate().timeIntervalSince1970)
        self.ref.child("users").child("\(userID ?? "")").child("customs").child("Weights").child("\(self.favourite.id ?? "")").child("arrData").child("\(timestamp)").setValue([
            "id": "\(timestamp)",
            "title" : self.favourite.title!,
            "desc": self.favourite.desc!,
            "imageName": self.favourite.imageName!,
            "category": self.favourite.category!,
            "subCategory": self.favourite.subCategory!,
            "weights": self.weightsText.text!,
            "repititions": self.repititionsText.text!,
            
        ])
        
        self.giveAlertToUser(message: "Successfully added to customs.")
        self.getCustomWeights()
        self.weightsText.text = ""
        self.repititionsText.text = ""
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
            self.addToCustomWeights()
        }
        
    }
    
}

extension AddCustomWeightsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.removeCustomWeights(indexId: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrCustoms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddCustomWeightsTableViewCell") as! AddCustomWeightsTableViewCell
        cell.lblText?.text = "\(self.arrCustoms[indexPath.row].weights ?? "") * \(self.arrCustoms[indexPath.row].repititions ?? "")"
        
        
        let a = Double(self.arrCustoms[indexPath.row].id ?? "") ?? 0.0
        let myDate = NSDate(timeIntervalSince1970: a)
        print(myDate)
    
        let format = DateFormatter()
        format.dateFormat = "MMM-dd-yyyy 'at' HH:mm a"
        let timestamp = format.string(from: myDate as Date)
        
        cell.lblDateTime?.text = timestamp
        return cell
    }
}

