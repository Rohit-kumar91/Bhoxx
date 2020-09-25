//
//  CustomAlert.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 06/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import Foundation
import RMessage


class CustomAlert {
    
    static let shared = CustomAlert()
    
    func show(alert title: String , message : String, withSpec: RMessageSpec){
        let rControl = RMController()
        rControl.showMessage(
              withSpec: withSpec,
              title: title,
              body: message
        )
    }
    
}
