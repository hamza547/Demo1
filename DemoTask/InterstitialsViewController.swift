//
//  InterstitialsViewController.swift
//  DemoTask
//
//  Created by Hamza on 02/02/2021.
//

import UIKit
import AppLovinSDK

class InterstitialsViewController: UIViewController, MAAdDelegate {
    
    let interstitialAd = MAInterstitialAd(adUnitIdentifier: "f468807b3dd02a15")
    private var retryAttempt = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()

        interstitialAd.delegate = self
        
        // Load the first ad
        interstitialAd.load()
    }
    
    @IBAction func showAd(_ sender: Any) {
        
        interstitialAd.show()
    }
    
    // MARK: MAAdDelegate Protocol
    
    func didLoad(_ ad: MAAd)
    {
        // Interstitial ad is ready to be shown. '[self.interstitialAd isReady]' will now return 'YES'
        
        // Reset retry attempt
        retryAttempt = 0
    }
    
    func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withErrorCode errorCode: Int)
    {
        
        // Interstitial ad failed to load. We recommend retrying with exponentially higher delays up to a maximum delay (in this case 64 seconds).
        
        retryAttempt += 1
        let delaySec = pow(2.0, min(6.0, retryAttempt))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delaySec) {
            self.interstitialAd.load()
        }
    }
    
    func didDisplay(_ ad: MAAd) { }
    
    func didClick(_ ad: MAAd) { }
    
    func didExpand(_ ad: MAAd) { }
    
    func didCollapse(_ ad: MAAd) { }
    
    func didHide(_ ad: MAAd)
    {
        // Interstitial ad is hidden. Pre-load the next ad
        interstitialAd.load()
    }
    
    func didFail(toDisplay ad: MAAd, withErrorCode errorCode: Int)
    {        
        // Interstitial ad failed to display. We recommend loading the next ad
        interstitialAd.load()
    }

}
