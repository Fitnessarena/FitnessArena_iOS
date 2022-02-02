//
//  FavouritesViewController.swift
//  FitnessArena
//
//  Created by Akshay on 2022-02-02.
//

import UIKit
import Firebase

class FavouritesViewController: UIViewController {

    var arrFavourites : [Favourite] = []
    let ref = Database.database().reference()
    let timestamp = NSDate().timeIntervalSince1970
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    class func identifier() -> FavouritesViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FavouritesViewController") as! FavouritesViewController
    }

}

extension FavouritesViewController {
    
    func getMyFavourites() {
            self.arrFavourites.removeAll()
            let userID = UserDefaults.standard.value(forKey: "loggedInUserID")
        
            if userID != nil {
                let placeRef = self.ref.child("users").child("\(userID ?? "")").child("favourites")
                
                placeRef.observeSingleEvent(of: .value, with: { snapshot in
                    
                    if snapshot.childrenCount > 0 {
                        for child in snapshot.children {
                            let snap = child as! DataSnapshot
                            let placeDict = snap.value as! [String: Any]
                            
                            if let subscription: Subscription = Mapper<Subscription>().map(JSON: placeDict) {
                                self.arrSubscriptions.append(subscription)
                            }
                        }
                        self.tableView.reloadData()
                    } else {
                        self.tableView.reloadData()
                    }
                })
            }
        }
}
