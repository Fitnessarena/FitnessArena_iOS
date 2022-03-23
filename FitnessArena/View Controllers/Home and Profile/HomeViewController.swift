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
    
    private var interstitial: GADInterstitialAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileButton.setTitle("", for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAdBanner()
    }
    class func identifier() -> HomeViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
    }

    func setAdBanner() {
        
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID:"ca-app-pub-3940256099942544/4411468910",
                               request: request,
                               completionHandler: { [self] ad, error in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            interstitial = ad
            interstitial?.fullScreenContentDelegate = self
        }
        )
        
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
        if interstitial != nil {
            interstitial?.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
        
        self.push(vc: CustomControllers.identifier())
    }
    
    @IBAction func profileButtonTapped(_ sender: Any) {
        let vc = ProfileViewController.identifier()
        self.push(vc: vc)
    }
    
}

extension HomeViewController: GADFullScreenContentDelegate {
    /// Tells the delegate that the ad failed to present full screen content.
      func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content.")
      }

      /// Tells the delegate that the ad will present full screen content.
      func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad will present full screen content.")
      }

      /// Tells the delegate that the ad dismissed full screen content.
      func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
      }
}
