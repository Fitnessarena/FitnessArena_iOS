//
//  HomeViewController.swift
//  FitnessArena
//
//  Created by Akshay on 2021-12-13.
//

import UIKit
import GoogleMobileAds

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var profileButton: UIButton!
    
    var bannerView: GADBannerView!
    let adSize = GADAdSizeFromCGSize(CGSize(width: 300, height: 64))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileButton.setTitle("", for: .normal)
        
//        bannerView.adUnitID = "ca-app-pub-3940256099942544~2934735716"
//        bannerView.rootViewController = self
//        bannerView.load(GADRequest())
//        bannerView.delegate = self
    }
    
    class func identifier() -> HomeViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
    }
    
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: bottomLayoutGuide,
                                attribute: .top,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }
    
    @IBAction func cardioButtonTapped(_ sender: Any) {
        let vc = CardioViewController.identifier()
        vc.category = "Cardio"
        self.push(vc: vc)
    }
    
    @IBAction func weightsButtonTapped(_ sender: Any) {
        let vc = WeightsViewController.identifier()
        vc.category = "Weights"
        self.push(vc: vc)
    }
    
    @IBAction func nutritionButtonTapped(_ sender: Any) {
        let vc = NutriViewController.identifier()
        vc.category = "Nutrition"
        self.push(vc: vc)
    }
    
    @IBAction func favouritesButtonTapped(_ sender: Any) {
        self.push(vc: FavouritesViewController.identifier())
    }
    
    @IBAction func customButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "customScreenSegue", sender: nil)
    }
    
    @IBAction func profileButtonTapped(_ sender: Any) {
        let vc = ProfileViewController.identifier()
        self.push(vc: vc)
    }
    
}

extension HomeViewController : GADBannerViewDelegate{
    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
      print("bannerViewDidReceiveAd")
        bannerView.alpha = 0
          UIView.animate(withDuration: 1, animations: {
            bannerView.alpha = 1
          })
    }

    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
      print("bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }

    func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
      print("bannerViewDidRecordImpression")
    }

    func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
      print("bannerViewWillPresentScreen")
    }

    func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
      print("bannerViewWillDIsmissScreen")
    }

    func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
      print("bannerViewDidDismissScreen")
    }
}
