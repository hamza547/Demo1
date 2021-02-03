//
//  SecondRewardViewController.swift
//  DemoTask
//
//  Created by Hamza on 02/02/2021.
//

import UIKit
import AppLovinSDK

class SecondRewardViewController: UIViewController, MARewardedAdDelegate {
    
    private let rewardedAd = MARewardedAd.shared(withAdUnitIdentifier: "ff14e0f71cd98499")
    private var retryAttempt = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rewardedAd.delegate = self
        overrideUserInterfaceStyle = .light
        
        // Load the first ad
        rewardedAd.load()
    }
    
    // MARK: MAAdDelegate Protocol
    
    func didLoad(_ ad: MAAd)
    {
        // Rewarded ad is ready to be shown. '[self.rewardedAd isReady]' will now return 'YES'
        
        // Reset retry attempt
        retryAttempt = 0
        
        rewardedAd.show()
    }
    
    func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withErrorCode errorCode: Int)
    {
        // Rewarded ad failed to load. We recommend retrying with exponentially higher delays up to a maximum delay (in this case 64 seconds).
        
        retryAttempt += 1
        let delaySec = pow(2.0, min(6.0, retryAttempt))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delaySec) {
            self.rewardedAd.load()
        }
    }
    
    func didDisplay(_ ad: MAAd) { }
    
    func didClick(_ ad: MAAd) { }
    
    func didHide(_ ad: MAAd)
    {
        // Rewarded ad is hidden. Pre-load the next ad
        rewardedAd.load()
    }
    
    func didFail(toDisplay ad: MAAd, withErrorCode errorCode: Int)
    {
        // Rewarded ad failed to display. We recommend loading the next ad
        rewardedAd.load()
    }
    
    // MARK: MARewardedAdDelegate Protocol
    
    func didStartRewardedVideo(for ad: MAAd) { }
    
    func didCompleteRewardedVideo(for ad: MAAd) { }
    
    func didRewardUser(for ad: MAAd, with reward: MAReward)
    {
        // Rewarded ad was displayed and user should receive the reward
        
        // Demiss the view controller after watching the rewad add
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
