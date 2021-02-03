//
//  Alert.swift
//  Task 01
//
//  Created by Hamza on 26/12/2020.
//

import Foundation
import RKDropdownAlert

class Alert : UIViewController {
    
    // Function to Show Alerts
    
    func showAlert(_ title: String, message: String, handler: ((UIAlertAction) -> Void)?) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: handler)
        ac.addAction(ok)
        present(ac, animated: true, completion: nil)
    }
    
    func showSuccessAlert(message : String){
        
        RKDropdownAlert.show()
        RKDropdownAlert.title("", message: message , backgroundColor: UIColor.green, textColor: UIColor.white)
        
    }
    
    func showFailAlert(message : String){
        
        RKDropdownAlert.show()
        RKDropdownAlert.title("", message: message , backgroundColor: UIColor.red, textColor: UIColor.white)
    }
}
