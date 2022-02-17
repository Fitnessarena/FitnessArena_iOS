//
//  ArmsDetailViewController.swift
//  FitnessArena
//
//  Created by Akshay on 2021-12-14.
//

import UIKit
import Firebase
import ObjectMapper

class ArmsDetailViewController: UIViewController {

    @IBOutlet weak var labeltxt: UILabel!
    @IBOutlet weak var detailList: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var favouriteBtn: UIButton!
    
    var name = ""
    var details = ""
    var images = ""
    
    var category = ""
    var subCategory = ""
    var isFromCustomsController : Bool = false
    
    var favourite = Favourite()
    var arrFavourites : [Favourite] = []
    let ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.isFromCustomsController {
            self.favouriteBtn.setImage(UIImage(named: "ic_plus"), for: .normal)
            self.getMyCustoms()
        } else {
            self.getMyFavourites()
        }
        
        self.backBtn.setTitle("", for: .normal)
        self.homeBtn.setTitle("", for: .normal)
        self.favouriteBtn.setTitle("", for: .normal)
        
        labeltxt.text = name
        labeltxt.font = labeltxt.font.withSize(38)
        detailList.text = details
        detailList.font = detailList.font?.withSize(16)
        imageView.image = UIImage(named: images)
    }
    
    class func identifier() -> ArmsDetailViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ArmsDetailViewController") as! ArmsDetailViewController
    }
    
    func addFavourite() {
        let userID = UserDefaults.standard.value(forKey: "loggedInUserID")
        let timestamp = Int(NSDate().timeIntervalSince1970)
        self.ref.child("users").child("\(userID ?? "")").child("favourites").child("\(self.category)").child("\(timestamp)").setValue([
            "id": "\(timestamp)",
            "title" : self.name,
            "desc": self.details,
            "imageName": self.images,
            "category": self.category,
            "subCategory": self.subCategory
        ])
        
        self.giveAlertToUser(message: "Successfully added to your customs")
        self.favouriteBtn.isHidden = true
        //SET IT TO 1 as it is Marked as favourite
        self.favouriteBtn.tag = 1
    }
    
    func removeFavourites() {
        
        if let id = self.favourite.id {
            let userID = UserDefaults.standard.value(forKey: "loggedInUserID")
            self.ref.child("users").child("\(userID ?? "")").child("favourites").child("\(self.category)").child(id).removeValue()
            let alert = UIAlertController(title: "Success", message: "Successfully removed from favourites.", preferredStyle: UIAlertController.Style.alert)
            
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { action in
                // do something like...
                self.popVC()
                
            }))
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func getMyFavourites() {
        self.arrFavourites.removeAll()
        let userID = UserDefaults.standard.value(forKey: "loggedInUserID")
        
        if userID != nil {
            let placeRef = self.ref.child("users").child("\(userID ?? "")").child("favourites").child("\(self.category)")
            
            placeRef.observeSingleEvent(of: .value, with: { snapshot in
                
                if snapshot.childrenCount > 0 {
                    for child in snapshot.children {
                        let snap = child as! DataSnapshot
                        let placeDict = snap.value as! [String: Any]
                        
                        if let favourite: Favourite = Mapper<Favourite>().map(JSON: placeDict) {
                            if favourite.title == self.name {
                                self.favouriteBtn.tag = 1
                                self.favouriteBtn.setImage(UIImage(named: "heart-filled"), for: .normal)
                                break
                            }
                        }
                    }
                    
                } else {
                    self.favouriteBtn.tag = 0
                }
            })
        }
    }
    
    func getMyCustoms() {
        self.arrFavourites.removeAll()
        let userID = UserDefaults.standard.value(forKey: "loggedInUserID")
        
        if userID != nil {
            let placeRef = self.ref.child("users").child("\(userID ?? "")").child("customs").child("\(self.category)")
            
            placeRef.observeSingleEvent(of: .value, with: { snapshot in
                
                if snapshot.childrenCount > 0 {
                    for child in snapshot.children {
                        let snap = child as! DataSnapshot
                        let placeDict = snap.value as! [String: Any]
                        
                        if let favourite: Favourite = Mapper<Favourite>().map(JSON: placeDict) {
                            if favourite.title == self.name {
                                self.favourite = favourite
                                self.favouriteBtn.tag = 1
                                //self.favouriteBtn.isHidden = true
                                self.favouriteBtn.setImage(UIImage(named: "ic_minus"), for: .normal)
                                break
                            }
                        }
                    }
                } else {
                    self.favouriteBtn.setImage(UIImage(named: "ic_plus"), for: .normal)
                    self.favouriteBtn.tag = 0
                }
            })
        }
    }
    
    func addToCustoms() {
        let userID = UserDefaults.standard.value(forKey: "loggedInUserID")
        let timestamp = Int(NSDate().timeIntervalSince1970)
        self.ref.child("users").child("\(userID ?? "")").child("customs").child("\(self.category)").child("\(timestamp)").setValue([
            "id": "\(timestamp)",
            "title" : self.name,
            "desc": self.details,
            "imageName": self.images,
            "category": self.category,
            "subCategory": self.subCategory
        ])
        
        self.giveAlertToUser(message: "Successfully added to customs.")
        self.favouriteBtn.setImage(UIImage(named: "ic_minus"), for: .normal)
        //SET IT TO 1 as it is Marked as favourite
        self.favouriteBtn.tag = 1
    }
    
    func removeCustoms() {
        
        if let id = self.favourite.id {
            let userID = UserDefaults.standard.value(forKey: "loggedInUserID")
            self.ref.child("users").child("\(userID ?? "")").child("customs").child("\(self.category)").child(id).removeValue()
            let alert = UIAlertController(title: "Success", message: "Successfully removed from your customs.", preferredStyle: UIAlertController.Style.alert)
            
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { action in
                // do something like...
                self.popVC()
                
            }))
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        self.popVC()
    }
    
    @IBAction func homeButtonTapped(_ sender: Any) {
        self.popToRootVC()
    }
    
    @IBAction func favouriteButtonTapped(_ sender: Any) {
        if self.isFromCustomsController {
            //ADD TO CUSTOMS LIST
            if self.favouriteBtn.tag == 0 {
                self.addToCustoms()
            } else {
                self.removeCustoms()
            }
        } else {
            //ADD TO FAVOURITES LIST
            if self.favouriteBtn.tag == 0 {
                //NOT MARKED AS FAVOURITE SO MARK IT AS FAVOURITE
                self.addFavourite()
            } else {
                self.removeFavourites()
            }
        }
    }
}
