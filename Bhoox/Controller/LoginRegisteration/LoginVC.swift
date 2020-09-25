//
//  LoginVC.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 06/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    //MARK: Outlets
    
    @IBOutlet weak var txfEmail: UITextFieldX!
    @IBOutlet weak var txfPassword: UITextFieldX!
    @IBOutlet weak var btnLogin: UIButtonX!
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var btnFacebook: UIButton!
    @IBOutlet weak var btnGoogle: UIButton!
    @IBOutlet weak var btnDontHaveAccount: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //MARK:- Actions
    @IBAction func btnCommonAction(_ sender: UIButton) {
        
        switch sender {
        case btnLogin:
            break
        case btnForgotPassword:
            break
        case btnFacebook:
            break
        case btnGoogle:
            break
        case btnDontHaveAccount:
            signUp()
            break
        default:
            break
        }
        
    }
    
}

extension LoginVC {
    
    func loginApi() {
        
    }
    
    func forgotPassword() {
        
    }
    
    func facebookLogin() {
        
    }
    
    func googleLogin() {
        
    }
    
    func signUp() {
        guard let registerationVC = R.storyboard.loginRegisteration.registerationVC() else { return}
        pushVC(registerationVC)
    }
}


