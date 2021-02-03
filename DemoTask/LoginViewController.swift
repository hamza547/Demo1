//
//  LoginViewController.swift
//  DemoTask
//
//  Created by Hamza on 02/02/2021.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pwd: UITextField!
    
    let v = ValidationMethods()
    let alert = Alert()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        email.setUnderLine()
        pwd.setUnderLine()
    }

    @IBAction func einloggen(_ sender: Any) {
        
        let em = email.text!
        let pd = pwd.text!
        let s = v.checkLogin(email: em ,pwd: pd)
        
        performSegue(withIdentifier: "home", sender: self)

        
//        if ( s == "login") {
//
//            alert.showSuccessAlert(message: s)
//
//        } else {
//            alert.showFailAlert(message: s)
//        }
    }
}

