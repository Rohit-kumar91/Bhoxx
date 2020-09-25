//
//  ShowCategoryVC.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 08/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import UIKit

class ShowCategoryVC: UIViewController {
    
    //MARK: OUTLETS
    @IBOutlet weak var btnFilter: UIButton!
    @IBOutlet weak var btnMap: UIButton!
    @IBOutlet weak var btnShowMore: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var txfSearch1: UITextFieldX!
    @IBOutlet weak var txfSearch2: UITextFieldX!
    @IBOutlet weak var txfSearch3: UITextFieldX!
    @IBOutlet weak var btnCategory: UIButton!
    @IBOutlet weak var btnCities: UIButton!
    
    //MARK:- PROPERTIES
    var containerNavController: UINavigationController?
    let containerSegueName = "container"
    var rootVC: AnyClass?
    var saloon = [GetCategoryByIDModel]()
    var cat_id = String()
    var allCities = [Cities]()
    var categories = [ResponseData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txfSearch1.delegate = self
        txfSearch2.delegate = self
        txfSearch3.delegate = self
        getAllData()
    }
    
    
    //MARK:- ACTIONS
    @IBAction func btnActions(_ sender: UIButton) {
        switch sender {
        case btnFilter:
            break
            
        case btnShowMore:
            break
            
        case btnMap:
            if btnMap.isSelected == true {
                btnMap.isSelected = false
                btnMap.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                btnMap.tintColor = R.color.pink()
                btnMap.setTitleColor(R.color.pink(), for: .normal)
                guard let showAllCategoriesVC = R.storyboard.home.showAllCategories() else { return }
                showAllCategoriesVC.delegate = self
                showAllCategoriesVC.saloons = saloon
                containerNavController?.viewControllers = [showAllCategoriesVC]
                
            } else {
                btnMap.isSelected = true
                btnMap.backgroundColor = R.color.pink()
                btnMap.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
                btnMap.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                guard let mapViewVC = R.storyboard.home.categoryMapVC() else { return }
                mapViewVC.saloons = saloon
                containerNavController?.viewControllers = [mapViewVC]
            }
            break
            
        case btnCategory:
            guard let searchCategoryVC = R.storyboard.home.searchControllerVC() else { return }
            searchCategoryVC.searchType = .Category
            searchCategoryVC.delegate = self
            searchCategoryVC.categories = categories
            self.presentVC(searchCategoryVC)
            break
            
        case btnCities:
            guard let searchCategoryVC = R.storyboard.home.searchControllerVC() else { return }
            searchCategoryVC.searchType = .City
            searchCategoryVC.delegate = self
            searchCategoryVC.cities = allCities
            self.presentVC(searchCategoryVC)
            break
            
        default:
             popVC()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == containerSegueName {
            containerNavController = segue.destination as? UINavigationController
        }
    }
}

//MARK:- Textfield Delegate Fucntions
extension ShowCategoryVC: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if let searchCategoryVC = R.storyboard.home.searchControllerVC()  {
            if textField == txfSearch1 {
               
            } else if textField == txfSearch2 {
               
            }
        }
                
        return true
    }
}


//MARK:- Delagate
extension ShowCategoryVC: ShowAllCategoryDelegate, SearchCustomDelegate {
    
    func showAllServices(salonId: String?) {
        guard let showAllServicesVC = R.storyboard.home.showAllServicesVC() else { return }
        showAllServicesVC.salon_id = "19"
        showAllServicesVC.cat_id = cat_id
        self.pushVC(showAllServicesVC)
    }
    
    func searchByCity(id: String, name: String) {
        
    }
    
    func searchByCategory(id: String, name: String) {
           
    }
       
}


//MARK:- Functions
extension ShowCategoryVC {

    
    func getAllData() {
        
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()   // <<---
        
        EndPoint.getsaloonbycategory(cat_id: cat_id, start: "0", limit: "5").request(isLoader: true, success: { [weak self] (response) in
                 guard let saloons = response as? [GetCategoryByIDModel] else { return }
                 guard let showAllCategoriesVC = R.storyboard.home.showAllCategories() else { return }
                 self?.saloon = saloons
                 showAllCategoriesVC.delegate = self
                 showAllCategoriesVC.saloons = saloons
                 self?.containerNavController?.viewControllers = [showAllCategoriesVC]
                 dispatchGroup.leave()
             })
        
        
        
        dispatchGroup.enter()   // <<---
        EndPoint.cities(limit: "100").request(isLoader: true, success: { [weak self] (response) in
            guard let cities = response as? [Cities] else { return }
            self?.allCities = cities
            dispatchGroup.leave()
        })
        
        
        
        dispatchGroup.enter()   // <<---
        EndPoint.categories(limit: "10").request(isLoader: true, success: { [weak self] (response) in
            guard let categories = response as? [ResponseData] else { return }
            self?.categories = categories
            dispatchGroup.leave()
        })
        
    }
}
