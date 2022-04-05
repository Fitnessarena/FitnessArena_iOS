//
//  ProfileViewController.swift
//  FitnessArena
//
//  Created by Akshay on 2021-12-13.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import UserNotifications
import Stripe

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var btnNotification: UISwitch!
    @IBOutlet weak var btnRemoveAdvertisements: UIButton!
    
    let ref = Database.database().reference()
    
    let center = UNUserNotificationCenter.current()
    
//    let rzpKeyId = "rzp_test_itVjkb02ZaYVbm"
//    let rzpKeySecret = "BYVZ4s5kWWbhxf0mSZl2Z0gb"
    
    private var paymentIntentClientSecret: String?
    
    private static let backendURL = URL(string: "http://127.0.0.1:4242")!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.backButton.setTitle("", for: .normal)
        self.getUserProfile()
        
        center.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                print("Yay!")
            } else {
                print("D'oh")
            }
        }
        
        if UserDefaults.standard.valueExists(forKey: "isNotificationEnabled") {
            if let isNotificationEnabled = UserDefaults.standard.value(forKey: "isNotificationEnabled"), isNotificationEnabled as! Bool {
                self.btnNotification.isOn = true
            }
        }
        
    }
    
    class func identifier() -> ProfileViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
    }
    
    func getUserProfile() {
        
        guard let uid = Auth.auth().currentUser?.uid else {
            print("User not found")
            return
        }
        self.ref.child("users").child(uid).observeSingleEvent(of: .value, with: { snapshot in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let userId = value?["id"] as? String ?? ""
            let firstName = value?["firstName"] as? String ?? ""
            let lastName = value?["lastName"] as? String ?? ""
            let email = value?["email"] as? String ?? ""
            let mobile = value?["mobile"] as? String ?? ""
            
            self.firstNameTextField.text = firstName
            self.lastNameTextField.text = lastName
            self.emailTextField.text = email
            self.phoneTextField.text = mobile
        })
        
    }
    
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            phoneTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            
            return "Please fill in all fields."
        }
        return nil
    }
    
    func updateUser() {
        
        //VALIDATION
        guard let uid = Auth.auth().currentUser?.uid else {
            print("User not found")
            return
        }
        if  uid.count > 0 {
            self.ref.child("users").child(uid).updateChildValues([
                "firstName" : self.firstNameTextField.text!,
                "lastName" : self.lastNameTextField.text!,
            ])
        }
        self.present(Utilities.createAlertController(title: "Success", message: "Profile updated successfully"), animated: true, completion: nil)
    }
    
    @IBAction func updateButtonTapped(_ sender: Any) {
        let error = validateFields()
        if error != nil {
            
            // There's something wrong with the fields, show error message
            self.present(Utilities.createAlertController(title: "Cannot Sign Up", message: "Please check entered Fields"), animated: true, completion: nil)
        }
        else {
            self.updateUser()
            
        }
    }
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
        let auth = Auth.auth()
        
        do {
            try auth.signOut()
            let defaults = UserDefaults.standard
            defaults.set(false, forKey: "isUserSignedIn")
            self.dismiss(animated: true, completion: nil)
            
            let vc = LoginViewController.identifier()
            self.push(vc: vc)
        } catch let signOutError {
            self.present(Utilities.createAlertController(title: "Error", message: signOutError.localizedDescription), animated: true, completion: nil)
        }
    }
    
    @IBAction func btnRemoveAdvertisementsAction(_ sender: Any) {
        let config = STPPaymentConfiguration()
        config.requiredBillingAddressFields = .name
        let viewController = STPAddCardViewController(configuration: config, theme: STPTheme.default())
        viewController.delegate = self
        let navigationController = UINavigationController(rootViewController: viewController)
        present(navigationController, animated: true, completion: nil)
    }
    
    func scheduleNotification() {
        let center = UNUserNotificationCenter.current()

        let content = UNMutableNotificationContent()
        content.title = "Add your routine"
        content.body = "Come back and add your today's routine."
        content.categoryIdentifier = "daily_reminder"
        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = UNNotificationSound.default
        content.badge = 1
        var dateComponents = DateComponents()
        dateComponents.hour = 10
        dateComponents.minute = 30
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
//        var dateComponents = DateComponents()
//            dateComponents.hour = 10
//            dateComponents.minute = 30
//            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.popVC()
    }
    
    @IBAction func btnNotificationAction(_ sender: UISwitch) {
        
        if sender.isOn {
            UserDefaults.standard.set(true, forKey: "isNotificationEnabled")
            self.scheduleNotification()
        } else {
            //REMOVE NOTIFICATION
            UserDefaults.standard.set(false, forKey: "isNotificationEnabled")
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        }
        
    }
}

extension ProfileViewController : STPAddCardViewControllerDelegate {
    func addCardViewControllerDidCancel(_ addCardViewController: STPAddCardViewController) {
        print(addCardViewController)
    }
    
    func addCardViewController(_ addCardViewController: STPAddCardViewController, didCreatePaymentMethod paymentMethod: STPPaymentMethod, completion: @escaping STPErrorBlock) {
        print(paymentMethod)
    }
}
