//
//  Utility.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 06/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import Foundation
import UIKit

class Utility: NSObject {
    static let shared = Utility()
    
    
    override init() {
        super.init()
    }
    
    
    func showLoader() {
        ez.runThisInMainThread {
            //UIApplication.shared.beginIgnoringInteractionEvents()
        }
    }
    
    
    func hideLoader() {
        
        ez.runThisInMainThread {
            //UIApplication.shared.endIgnoringInteractionEvents()
        }
        
    }
    
    
}
