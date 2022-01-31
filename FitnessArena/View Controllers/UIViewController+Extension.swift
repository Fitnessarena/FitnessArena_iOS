//
//  UIViewController+Extension.swift
//  FitnessArena
//
//  Created by Akshay on 2022-01-31.
//

import Foundation
import UIKit

extension UIViewController {
    
    func push(vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func popController(vc: AnyClass?) {
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
