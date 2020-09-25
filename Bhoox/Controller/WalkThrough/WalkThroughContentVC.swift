//
//  WalkThroughContentVC.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 04/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import UIKit

class WalkThroughContentVC: UIViewController {
    
    
    //MARK:- Outlets
    @IBOutlet weak var contentViewImage: UIImageView!
    
    //MARK:- Properties
    var index = 0
    var imageFile = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        contentViewImage.image = UIImage(named: imageFile)
    }

}
