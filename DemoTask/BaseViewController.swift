//
//  BaseViewController.swift
//  DemoTask
//
//  Created by Hamza on 02/02/2021.
//

import UIKit

class BaseViewController: UIViewController {
    
    let inAd = InterstitialsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inAd.loadView()
    }

}
