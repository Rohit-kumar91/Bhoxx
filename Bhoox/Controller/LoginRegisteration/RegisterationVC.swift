//
//  RegisterationVC.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 06/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import UIKit

class RegisterationVC: UIViewController {
    
    //MARK:- Outlets
    
    @IBOutlet weak var txfName: UITextFieldX!
    @IBOutlet weak var txfEmail: UITextFieldX!
    @IBOutlet weak var txfMobile: UITextFieldX!
    @IBOutlet weak var txfPassword: UITextFieldX!
    @IBOutlet weak var btnSignUp: UIButtonX!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK:- Actions
    @IBAction func btnSignUpAction(_ sender: Any) {
        registeration()
    }
    
}

extension RegisterationVC {
    
    func registeration() {
        
        if Validations.sharedInstance.validationRegisteration(with: txfName.text ?? "", email: txfEmail.text ?? "", phoneNo: txfMobile.text ?? "", password: txfPassword.text ?? "") {
            EndPoint.registeration(first_name: txfName.text, last_name: "", email: txfEmail.text, password: txfPassword.text, gender: "", postcode: "").request(isLoader: true, success: { [weak self] (response) in
                guard let homeVC = R.storyboard.home.tabbarVC() else { return }
                self?.pushVC(homeVC)
            })
        }
    }
}
