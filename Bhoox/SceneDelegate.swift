//
//  SceneDelegate.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 04/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        print("1")
        setHomeAsRootVC()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
        print("2")
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        print("3")
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        print("4")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
        print("5")
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
        print("6")
    }


}

extension SceneDelegate {
    
    class func shared() -> SceneDelegate {
          return UIApplication.shared.delegate as! SceneDelegate
      }
      
      func setHomeAsRootVC() {
        guard let homeVC = R.storyboard.home.tabbarVC() else{ return }
          let navigation = UINavigationController(rootViewController: homeVC)
          navigation.isNavigationBarHidden = true
          self.setWindowAnimation(rootViewController: navigation)
      }
      
    func setWelcomeAsRootVC(isAppInstallFirstTime: Bool) {
        if isAppInstallFirstTime {
            guard let tutorialVC = R.storyboard.onboarding.walkThroughVC() else{return}
            let navigation = UINavigationController(rootViewController: tutorialVC)
            navigation.isNavigationBarHidden = true
            self.setWindowAnimation(rootViewController: navigation)
        } else {
            guard let loginVC = R.storyboard.loginRegisteration.loginVC() else{return}
            let navigation = UINavigationController(rootViewController: loginVC)
            navigation.isNavigationBarHidden = true
            self.setWindowAnimation(rootViewController: navigation)
        }
         
      }
    
    
    func setWindowAnimation( rootViewController: UIViewController) {
         guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
             fatalError("could not get scene delegate ")
           }
        sceneDelegate.window?.rootViewController = rootViewController
    }
}

