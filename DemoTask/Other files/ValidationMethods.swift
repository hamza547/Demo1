//
//  ValidationMethods.swift
//  Task 01
//
//  Created by Hamza on 25/12/2020.
//

import Foundation

public class ValidationMethods {
    
    let EMAIL_REGEX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let PASSWORD_REGEX = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[\\w~@#$%^&*+=`|{}:;!.?\"()\\[\\]-]{12,20}"
    
    func isValidEmail(testStr:String) -> Bool {

        let emailRegEx = EMAIL_REGEX
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
        
    func isValidPassword(testStr:String?) -> Bool {
        guard testStr != nil else { return false }
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", PASSWORD_REGEX)
        return passwordTest.evaluate(with: testStr)
    }
    
    func checkLogin( email: String, pwd: String) -> String {
        
        if (email == "") {
            
            return "Please enter email."
            
        } else if (pwd == "") {
            return "Please enter password."
        } else {
            if (!isValidEmail(testStr: email)) {
                
                return "Please enter a valid email."
                
            } else if (!isValidPassword(testStr: pwd)){
                
                return "Please enter a valid password."
                
            } else {
                
                return "login"
            }
        }
    }
    
    func checkSignup( email: String, pwd: String, cpwd: String) -> String {
        
        if (email == "") {
            
            return "Please enter email."
            
        } else if (pwd == "") {
            return "Please enter password."
        }else if (cpwd == "") {
            return "Please enter password."
        } else {
            if (!isValidEmail(testStr: email)) {
                
                return "Please enter a valid email."
                
            } else if (!isValidPassword(testStr: pwd)){
                
                return "Please enter a valid password."
                
            }else if !(cpwd == pwd){
                
                return "Password not match."
                
            } else {
                
                return "signup"
            }
        }
    }
}

