//
//  ForgotPasswordViewController.swift
//  FitnessArena
//
//  Created by Akshay on 2021-12-13.
//

import UIKit
import Firebase

class ForgotPasswordViewController: UIViewController {
    
    var email = ""
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.backButton.setTitle("", for: .normal)
        
        if self.email != "" {
            self.emailTextField.text = email
        }
    }
    
    class func identifier() -> ForgotPasswordViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.popVC()
    }
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        let auth = Auth.auth()
        
        auth.sendPasswordReset(withEmail: emailTextField.text!) { (error) in
            if let error = error {
                let alert = Utilities.createAlertController(title: "Error", message: error.localizedDescription)
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            let alert = UIAlertController(title: "Hurray", message: "Resent link sent to your email id.", preferredStyle: UIAlertController.Style.alert)
            
            // add the actions (buttons)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { action in
                // do something like...
                self.popVC()
                
            }))
            // show the alert
            self.present(alert, animated: true, completion: nil)
            
        }
 
    }
}
