//
//  Validations.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 06/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import Foundation
import RMessage

class Validations {
    
    static let sharedInstance = Validations()
    
    func validateEmail(email: String) -> Bool {
        if email.isBlank {
            CustomAlert.shared.show(alert: "Warning", message: "Please enter email address.", withSpec: warningSpec)
            return false
        } else {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
            let status = NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
            if status {
                return true
            } else {
                CustomAlert.shared.show(alert: "Error", message: "Please enter valid email address.", withSpec: warningSpec)
                return false
            }
        }
    }
    
    
    func validatePhoneNumber(phone: String) -> Bool {
       if phone.isBlank {
           CustomAlert.shared.show(alert: "Warning", message: "Please enter phone number.", withSpec: warningSpec)
           return false
       } else {
          if (phone.length > 15 || phone.length < 5 ) {
              CustomAlert.shared.show(alert: "Warning", message: "Please enter correct phone number.", withSpec: warningSpec)
              return false
          } else {
               return true
           }
       }
   }
    
    
    func validatePassword(password: String) -> Bool {
        if password.isBlank {
            CustomAlert.shared.show(alert: "Warning", message: "Please enter password.", withSpec: warningSpec)
            return false
        } else {
            return true
        }
    }
    
    
    func validateUserName(userName: String) -> Bool {
        if userName.isBlank {
            CustomAlert.shared.show(alert: "Warning", message: "Please enter user name.", withSpec: warningSpec)
            return false
        } else if userName.count < 3 {
            CustomAlert.shared.show(alert: "Warning", message: "Username should be greater than the 3 character.", withSpec: warningSpec)
            return false
        }
        
        else {
            return true
        }
    }
    
    
    func validationRegisteration(with name: String, email: String, phoneNo: String, password: String) -> Bool {
        if validateUserName(userName: name) {
            if validateEmail(email: email) {
                if validatePhoneNumber(phone: phoneNo) {
                    if validatePassword(password: password) {
                        return true
                    }
                }
            }
        }
        return false
    }
    
}
