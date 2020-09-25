//
//  ShowAllServicesVC.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 14/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import UIKit
import Nuke

struct CellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
}

class ShowAllServicesVC: UIViewController {
    
    //MARK:- Properties
    var salon_id: String?
    var cat_id: String?
    var getSaloonArr = [String]()
    var tableViewData = [GetSaloonByStyle]()
    var frame: CGRect = CGRect(x:0, y:0, width:0, height:0)

    //MARK:- Outlets
    @IBOutlet weak var tableAllServices: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.black
        pageControl.currentPageIndicatorTintColor = R.color.themeColor()
        
        getDetails()
        
        self.tableAllServices.register(UINib(nibName: "SaloonStyleTC", bundle: nil), forCellReuseIdentifier: "SaloonStyleTC")
        
        self.tableAllServices.register(UINib(nibName: "SaloonStyleChildTC", bundle: nil), forCellReuseIdentifier: "SaloonStyleChildTC")
        
        tableAllServices.delegate = self
        tableAllServices.dataSource = self
    }
    
    
    //MARK:- ACTIONS
    @IBAction func btnBackAction(_ sender: Any) {
        self.popVC()
    }
    
    @IBAction func btnSeePortFolioAction(_ sender: Any) {
        guard let portfolioVC = R.storyboard.home.portfolioVC() else { return }
        portfolioVC.salon_id = /salon_id
        self.pushVC(portfolioVC)
    }
    
}

//MARK:- ScrollView Delegate
extension ShowAllServicesVC {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
}

//MARK:- APIs - Fucntions
extension ShowAllServicesVC {
    
    @objc func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
    }
    
    func getDetails() {
        let dispatchGroup = DispatchGroup()

        dispatchGroup.enter()   // <<---
        
        EndPoint.getsaloonbanners(salon_id: salon_id).request(isLoader: true, success: { [weak self] (response) in
            ez.runThisInMainThread {
                
                guard let responseData = response as? CommonModel2 else { return }
                
                if  let banners = responseData.ResponseData {
                    self?.pageControl.numberOfPages = banners.count
                    for (index, banner) in banners.enumerated() {

                        self?.frame.origin.x = self?.scrollView.frame.size.width ?? 0 * CGFloat(index)
                        self?.frame.size = (self?.scrollView.frame.size)!

                        let subView = UIImageView(frame: /self?.frame)
                        subView.contentMode = .scaleToFill
                        if let url = URL(string: /banner.image) {
                            Nuke.loadImage(with: url, into: subView)
                        }
                        self?.scrollView.addSubview(subView)
                    }
                    
                    let totalWidth = /self?.scrollView.frame.size.width * CGFloat(banners.count)
                    
                    self?.scrollView.contentSize = CGSize(width: totalWidth, height: /self?.scrollView.frame.size.height)
                    
                    self?.pageControl.addTarget(self, action: #selector(self?.changePage(sender:)), for: UIControl.Event.valueChanged)

                    
                }
                
                dispatchGroup.leave()
            }
        })
        

        dispatchGroup.enter()   // <<---
        EndPoint.getsaloonstyles(salon_id: salon_id).request(isLoader: true, success: { [weak self] (response) in
            
            ez.runThisInMainThread {
                guard let responseData = response as? [GetSaloonByStyle] else { return }
                self?.tableViewData = responseData
                self?.tableAllServices.reloadData()
                dispatchGroup.leave()
            }
            
        })
        
        
        dispatchGroup.enter()   // <<---
        EndPoint.getsaloonsubdata(salon_id: salon_id, cate_id: cat_id).request(isLoader: true, success: { [weak self] (response) in
            
            ez.runThisInMainThread {
                 dispatchGroup.leave()
            }
            
        })
        

        dispatchGroup.notify(queue: .main) {
            // whatever you want to do when both are done
        }
    }
    
}


extension ShowAllServicesVC: UITableViewDelegate, UITableViewDataSource {
    
     
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableViewData[section].opened == true {
            return tableViewData[section].nodes?.count ?? 0
        } else {
            return 1
        }
        
            
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SaloonStyleTC") as? SaloonStyleTC
            cell?.lblDetails.text = tableViewData[indexPath.section].title
            cell?.lblPrice.text = "$ \(/tableViewData[indexPath.section].price)"
            cell?.lblTime.text = tableViewData[indexPath.section].timeto
            
            if tableViewData[indexPath.section].nodes?.count == 0  {
                cell?.btnAddMore.setImage(UIImage(systemName: "plus.circle"), for: .normal)
            } else {
                cell?.btnAddMore.setImage(UIImage(systemName: ""), for: .normal)
            }
            
            return cell!

        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SaloonStyleChildTC") as? SaloonStyleChildTC
            cell?.lblDetial.text = tableViewData[indexPath.section].nodes?[indexPath.row].title
            cell?.lblTime.text = tableViewData[indexPath.section].nodes?[indexPath.row].timeto
            cell?.lblPrice.text = "$ \(/tableViewData[indexPath.section].nodes?[indexPath.row].price)"
            cell?.lblSpecialPrice.text = "$ \(/tableViewData[indexPath.section].nodes?[indexPath.row].special_price)"
            return cell!
        }

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
       if tableViewData[indexPath.section].nodes?.count == 0  { return }
        
        if tableViewData[indexPath.section].opened == true {
               tableViewData[indexPath.section].opened = false
               let sections = IndexSet.init(integer: indexPath.section)
               tableView.reloadSections(sections, with: .none)
           } else {
               tableViewData[indexPath.section].opened = true
               let sections = IndexSet.init(integer: indexPath.section)
               tableView.reloadSections(sections, with: .none)
           }
    }
    
    


}
