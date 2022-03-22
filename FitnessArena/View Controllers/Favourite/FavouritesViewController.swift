//
//  FavouritesViewController.swift
//  FitnessArena
//
//  Created by Akshay on 2022-02-02.
//

import UIKit
import Firebase
import ObjectMapper

class FavouritesViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var arrFavourites : [Favourite] = []
    let ref = Database.database().reference()
    let timestamp = NSDate().timeIntervalSince1970
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerTableViewCells()
        self.backBtn.setTitle("", for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.calApi()
    }
    
    class func identifier() -> FavouritesViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FavouritesViewController") as! FavouritesViewController
    }

    func registerTableViewCells() {
        let favouriteTableViewCell = UINib(nibName: "FavouriteTableViewCell", bundle: nil)
        self.tableView.register(favouriteTableViewCell, forCellReuseIdentifier: "FavouriteTableViewCell")
    }
    
    func getFavourites(val: String) {
        self.arrFavourites.removeAll()
        let userID = UserDefaults.standard.value(forKey: "loggedInUserID")
        
        if userID != nil {
            let placeRef = self.ref.child("users").child("\(userID ?? "")").child("favourites").child("\(val)")
            
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
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.popVC()
    }

    func calApi() {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            self.getFavourites(val: "Cardio")
        case 1:
            self.getFavourites(val: "Weights")
        case 2:
            self.getFavourites(val: "Nutrition")
        default:
            break
        }
    }
    
    @IBAction func segmentedButtonTapped(_ sender: Any) {
        self.calApi()
    }
    
}

extension FavouritesViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "FavouritesDetailViewController") as? FavouritesDetailViewController{
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

extension FavouritesViewController {
    
//    func getMyFavourites() {
//        self.arrFavourites.removeAll()
//        let userID = UserDefaults.standard.value(forKey: "loggedInUserID")
//
//        if userID != nil {
//            let placeRef = self.ref.child("users").child("\(userID ?? "")").child("favourites")
//
//            placeRef.observeSingleEvent(of: .value, with: { snapshot in
//
//                if snapshot.childrenCount > 0 {
//                    for child in snapshot.children {
//                        let snap = child as! DataSnapshot
//                        let placeDict = snap.value as! [String: Any]
//
//                        if let favourite: Favourite = Mapper<Favourite>().map(JSON: placeDict) {
//                            self.arrFavourites.append(favourite)
//                        }
//                    }
//                    self.tableView.reloadData()
//                } else {
//                    self.tableView.reloadData()
//                }
//            })
//        }
//    }
    
    func showDeleteConfirmation() {
            
            let alert = UIAlertController(title: "Delete", message: "Are you sure to remove from your favourites?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { (_) in
                //self.deleteFavourite()
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
                
            }))
            
            self.present(alert, animated: true, completion: nil)
        }
}
