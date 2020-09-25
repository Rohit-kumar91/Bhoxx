//
//  WalkThroughPageVC.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 04/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import UIKit

protocol WalkthroughPageVCDelegate: class {
    func didUpdatePageIndex(index: Int)
}

class WalkThroughPageVC: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        
    //MARK:- Properties
    var images = ["WT1", "WT2", "WT3"]
    var currentIndex = 0
    
    weak var wtdelegate: WalkthroughPageVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set datasource to self
        dataSource = self
        delegate = self
        
        //create the first walkthrough screen.
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
        
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkThroughContentVC).index
        index -= 1
        
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkThroughContentVC).index
        index += 1
        
        return contentViewController(at: index)
    }
    
    //MARK:- HELPER
    func contentViewController(at index: Int) -> WalkThroughContentVC? {
        if index < 0 || index >= images.count {
            return nil
        }
        
        //Create a new view controller and pass suitable data
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(identifier: "WalkThroughContentVC") as? WalkThroughContentVC {
            pageContentViewController.imageFile = images[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        
        return nil
    }
    
    func forwardPage() {
        currentIndex += 1
        if let nextViewController = contentViewController(at: currentIndex) {
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    //MARK: PageViewController Delegate
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let contentViewController = pageViewController.viewControllers?.first as? WalkThroughContentVC {
                currentIndex = contentViewController.index
                wtdelegate?.didUpdatePageIndex(index: currentIndex)
            }
        }
    }
    
}
 

