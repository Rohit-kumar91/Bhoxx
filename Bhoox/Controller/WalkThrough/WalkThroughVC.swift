//
//  WalkThroughVC.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 04/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import UIKit

class WalkThroughVC: UIViewController, WalkthroughPageVCDelegate {
    
    
    
    //MARK:- Outlets
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = 25.0
            nextButton.layer.masksToBounds = true
        }
    }
    
    @IBOutlet var skipButton: UIButton!
    
    //MARK:- Properties
    var walkthroughPageViewController : WalkThroughPageVC?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func skipButton(sender: UIButton) {
        print("go to next view..")
    
    }
    
    @IBAction func nextButton(sender: UIButton) {
        if let index = walkthroughPageViewController?.currentIndex  {
            switch index {
            case 0...1:
                Utility.shared.showLoader()
                walkthroughPageViewController?.forwardPage()
                
            case 2:
                Utility.shared.showLoader()
                print("Last Page")
                guard let loginVC = R.storyboard.loginRegisteration.loginVC() else { return }
                self.pushVC(loginVC)
                
            default:
                break
            }
        }
        
        updateUI()
       
    }
    
    
    func updateUI() {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                nextButton.setTitle("NEXT", for: .normal)
                skipButton.isHidden = false
                
            case 2:
                nextButton.setTitle("GET STARTED", for: .normal)
                skipButton.isHidden = true
                
            default:
                break
            }
            
            pageControl.currentPage = index
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController =  destination as? WalkThroughPageVC {
            walkthroughPageViewController = pageViewController
            walkthroughPageViewController?.wtdelegate = self
        }
    }
    
    func didUpdatePageIndex(index: Int) {
        updateUI()
    }


}
