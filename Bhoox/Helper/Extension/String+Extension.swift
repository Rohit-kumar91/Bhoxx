
//
//  String+Extension.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 06/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import UIKit

extension String {
    var localized: String {
        let bundle = Bundle.main
        if let path = bundle.path(forResource: "en", ofType: "lproj"), let bundal = Bundle(path: path) {
            return bundal.localizedString(forKey: self, value: "", table: "Localizable")
        }
        return self
        //fatalError("Key Not Found")
    }
}
