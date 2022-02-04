//
//  UIViewController+Extension.swift
//  FitnessArena
//
//  Created by Akshay on 2022-01-31.
//

import Foundation
import UIKit

extension UIViewController {
    
    enum WLFoodType {
        case Breakfast
        case AMSnack
        case Lunch
        case PMSnack
        case Dinner
    }
    
    enum BMFoodType {
        case Breakfast
        case AMSnack
        case Lunch
        case PMSnack
        case Dinner
        case Protein
        case PreWorkout
        case PostWorkout
        case PreBedSnack
    }
    
    func giveAlertToUser(message: String){
        let  alertController = UIAlertController(title: "FitnessArena", message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func push(vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func popVC() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func popToSpecificController(vc: AnyClass?) {
        guard let vcClass = vc else {
            self.navigationController?.popViewController(animated: true)
            return
        }
        for vc in self.navigationController!.viewControllers {
            if vc.isKind(of: vcClass) {
                self.navigationController?.popToViewController(vc, animated: true)
                break
            }
        }
        
    }
    
    func popToRootVC() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
