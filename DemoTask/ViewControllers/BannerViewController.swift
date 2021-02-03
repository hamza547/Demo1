//
//  BannerViewController.swift
//  DemoTask
//
//  Created by Hamza on 02/02/2021.
//

import UIKit
import AppLovinSDK

class BannerViewController: UIViewController, MAAdViewAdDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var bannerView: UIView!
    
    var adView: MAAdView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        adView = MAAdView(adUnitIdentifier: "dde2ca78eb234659")
        adView.delegate = self
        overrideUserInterfaceStyle = .light
        
        // Calculate dimensions
        let width = bannerView.frame.width // Stretch to the width of the screen for banners to be fully functional
        let height: CGFloat = (UIDevice.current.userInterfaceIdiom == .pad) ? 90 : 60 // Banner height on iPhone and iPad is 50 and 90, respectively
        let x: CGFloat = bannerView.frame.origin.x
        let y: CGFloat = bannerView.frame.origin.y
        
        adView.frame = CGRect(x: x, y: y, width: width, height: height)
        
        // Set background or background color for banners to be fully functional
        adView.backgroundColor = .clear
        
        view.addSubview(adView)
        view.bringSubviewToFront(adView)
        
        // Load the first ad
        adView.loadAd()
        
    }
    
    // TableView Delegate Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "normalCell", for: indexPath)
        cell.textLabel?.text  = "Exercise \(indexPath.row)"
        cell.imageView?.image = UIImage(named: "istockphoto-853271840-612x612")
        cell.accessoryType = .disclosureIndicator
        cell.detailTextLabel?.text = "The exercise short desiption will be given here."
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

            self.performSegue(withIdentifier: "ViewController", sender: self)
            tableView.deselectRow(at: indexPath, animated: true)

        }
    
    // MARK: MAAdDelegate Protocol
    
    func didLoad(_ ad: MAAd) {
    }
    
    func didFailToLoadAd(forAdUnitIdentifier adUnitIdentifier: String, withErrorCode errorCode: Int) {
        adView.isHidden = false
        adView.startAutoRefresh()
    }

    func didDisplay(_ ad: MAAd) {  }
    
    func didHide(_ ad: MAAd) {
        adView.isHidden = true
        adView.stopAutoRefresh()
    }
    
    func didClick(_ ad: MAAd) { }
    
    func didFail(toDisplay ad: MAAd, withErrorCode errorCode: Int) { }
    
    // MARK: MAAdViewAdDelegate Protocol
    
    func didExpand(_ ad: MAAd) { }
    
    func didCollapse(_ ad: MAAd) { }

}
