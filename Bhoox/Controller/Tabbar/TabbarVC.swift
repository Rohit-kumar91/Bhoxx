//
//  TabbarVC.swift
//  Try
//
//  Created by Apple on 02/01/20.
//  Copyright © 2020 Code Brew Labs. All rights reserved.
//

import UIKit

class TabbarVC: UITabBarController, UITabBarControllerDelegate {

    //Mark: Properties
    var profileBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTabBarItems()
        self.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        debugPrint("")
    }
    
    func setTabBarItems() {
        self.tabBar.unselectedItemTintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        view.layoutIfNeeded()
    }
    
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        if viewController != tabBarController.viewControllers?.first {
//            if self.checkForLogin(TabbarVC.self) {
//                return true
//            }else {
//                return false
//            }
//        }
        return true
    }

}

