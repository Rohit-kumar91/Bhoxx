//
//  UDSingleton.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 06/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import Foundation
import UIKit

class UDSingleton: NSObject {
    static let shared = UDSingleton()
    
    func tokenExpired() {
        clearLocalUser()
        SceneDelegate.shared().setWelcomeAsRootVC(isAppInstallFirstTime: false)
    }
    
    func clearLocalUser() {
        UserDefaults.standard.synchronize()
    }
}
