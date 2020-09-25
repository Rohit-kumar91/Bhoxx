//
//  UIViewControllerExtensions.swift
//  AE
//
//  Created by MAC_MINI_6 on 19/03/19.
//  Copyright © 2019 MAC_MINI_6. All rights reserved.
//

import UIKit

extension UIViewController {
  func pushVC(_ vc: UIViewController, animated: Bool = true) {
    navigationController?.pushViewController(vc, animated: animated)
  }
  
  func popVC() {
    navigationController?.popViewController(animated: true)
  }
  
  func presentVC(_ vc: UIViewController) {
    navigationController?.present(vc, animated: true, completion: nil)
  }
  
  func dismissVC() {
    dismiss(animated: true, completion: nil)
  }
  
  func topMostVC() -> UIViewController {
    let vc = UIApplication.topVC()
    guard let topVC = vc else {
      return UIViewController()
    }
    return topVC
  }
  
  func popTo<T: UIViewController>(toControllerType: T.Type) {
    if var viewControllers: [UIViewController] = self.navigationController?.viewControllers {
      viewControllers = viewControllers.reversed()
      for currentViewController in viewControllers {
        if currentViewController .isKind(of: toControllerType) {
          self.navigationController?.popToViewController(currentViewController, animated: true)
          break
        }
      }
    }
  }
  
  func actionSheet(for actions: [String], title: String?, message: String?, tapped: ((_ actionString: String?) -> Void)?) {
    let actionSheetController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    
    actions.forEach {
      
      let action = UIAlertAction(title: $0, style: .default, handler: { (action) in
        tapped?(action.title)
      })
      //action.setValue(Color.darkTextColor.value, forKey: "titleTextColor")
      actionSheetController.addAction(action)
    }
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
      
    })
    //cancelAction.setValue(Color.darkTextColor.value, forKey: "titleTextColor")
    actionSheetController.addAction(cancelAction)
    present(actionSheetController, animated: true, completion: nil)
  }
  
  
  //MARK:- Present PopUp
  func presentPopUp(_ destVC: UIViewController) {
    addChild(destVC)
    destVC.view.frame = view.frame
    view.addSubview(destVC.view)
    destVC.didMove(toParent: self)
  }
  
  //MARK:- PopUps start
  func startPopUpWithAnimation() {
    view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
    view.alpha = 0.0
    UIView.animate(withDuration: 0.25, animations: {
      self.view.alpha = 1.0
      self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    })
  }
  
  //MARK:- PopUp End
  func removePopUp() {
    UIView.animate(withDuration: 0.25, animations: {
      self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
      self.view.alpha = 0.0
    }, completion: {(finished: Bool) in
      if finished{
        self.view.removeFromSuperview()
      }
    })
  }
}
