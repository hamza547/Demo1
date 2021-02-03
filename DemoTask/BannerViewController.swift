//
//  BannerViewController.swift
//  DemoTask
//
//  Created by Hamza on 02/02/2021.
//

import UIKit
import AppLovinSDK

class BannerViewController: UIViewController, MAAdViewAdDelegate, UITableViewDataSource {

    @IBOutlet var bannerView: UIView!
    private let adView = MAAdView(adUnitIdentifier: "dde2ca78eb234659")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        adView.delegate = self
        
        // Calculate dimensions
        let width = bannerView.frame.width // Stretch to the width of the screen for banners to be fully functional
        let height: CGFloat = (UIDevice.current.userInterfaceIdiom == .pad) ? 90 : 60 // Banner height on iPhone and iPad is 50 and 90, respectively
        let x: CGFloat = bannerView.frame.origin.x
        let y: CGFloat = bannerView.frame.origin.y
        
        adView.frame = CGRect(x: x, y: y, width: width, height: height)
        
        // Set background or background color for banners to be fully functional
        adView.backgroundColor = .clear
        
        view.addSubview(adView)
        
        // Load the first ad
        adView.loadAd()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        cell.textLabel?.text  = "this is row no: \(indexPath.row)"
        cell.imageView?.image = UIImage(named: "clock")
        cell.accessoryType = .disclosureIndicator
        cell.detailTextLabel?.text = "This is detail text."
        return cell
    }
    
    // MARK: MAAdDelegate Protocol
    
    func didLoad(_ ad: MAAd) { }
    
    func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withErrorCode errorCode: Int) {
        
    }

    func didDisplay(_ ad: MAAd) {  }
    
    func didHide(_ ad: MAAd) { }
    
    func didClick(_ ad: MAAd) { }
    
    func didFail(toDisplay ad: MAAd, withErrorCode errorCode: Int) { }
    
    // MARK: MAAdViewAdDelegate Protocol
    
    func didExpand(_ ad: MAAd) { }
    
    func didCollapse(_ ad: MAAd) { }

}
