//
//  FavouritesDetailViewController.swift
//  FitnessArena
//
//  Created by Akshay on 2022-02-02.
//

import UIKit
import Firebase

class FavouritesDetailViewController: UIViewController {
    
    @IBOutlet weak var labeltxt: UILabel!
    @IBOutlet weak var detailList: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var homeBtn: UIButton!
    @IBOutlet weak var favouriteBtn: UIButton!
    
    var favourite = Favourite()
    
    let ref = Database.database().reference()
    let timestamp = NSDate().timeIntervalSince1970
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.backBtn.setTitle("", for: .normal)
        self.homeBtn.setTitle("", for: .normal)
        self.favouriteBtn.setTitle("", for: .normal)
        
        labeltxt.text = self.favourite.title
        labeltxt.font = labeltxt.font.withSize(38)
        detailList.text = self.favourite.desc
        detailList.font = detailList.font?.withSize(16)
        imageView.image = UIImage(named: self.favourite.imageName!)
    }
    
    class func identifier() -> FavouritesDetailViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FavouritesDetailViewController") as! FavouritesDetailViewController
    }
    
    func removeFavourites() {
        
        if let id = self.favourite.id {
            
            let userID = UserDefaults.standard.value(forKey: "loggedInUserID")
            
            self.ref.child("users").child("\(userID ?? "")").child("favourites").child(id).removeValue()
            
            let alert = UIAlertController(title: "Success", message: "Successfully removed from favourites.", preferredStyle: UIAlertController.Style.alert)
            
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { action in
                // do something like...
                self.popController(vc: nil)
                
            }))
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.popController(vc: nil)
    }
    
    @IBAction func homeButtonTapped(_ sender: Any) {
        self.popToRootVC()
    }
    
    @IBAction func favouriteButtonTapped(_ sender: Any) {
        self.removeFavourites()
    }
}
