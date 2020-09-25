//
//  PortfolioVC.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 24/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import UIKit
import Cosmos
import GSImageViewerController

class PortfolioVC: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var portfolioCV: UICollectionView!
    @IBOutlet weak var lblStoreName: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    
    //MARK: Properties
    var portFolioArr = [PortfolioModel]()
    var salon_id = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        portfolioCV.delegate = self
        portfolioCV.dataSource = self
        getPortFolioData()

    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.popVC()
    }
}

extension PortfolioVC {
    
    func getPortFolioData() {
        
        EndPoint.getsaloonportfolio(salon_id: salon_id).request(isLoader: true, success: { [weak self] (response) in
            guard let responseData = response as? [PortfolioModel] else { return }
            self?.portFolioArr = responseData
            self?.portfolioCV.reloadData()
            
        })
        
    }
}

extension PortfolioVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return portFolioArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCC", for: indexPath) as? CategoryCC
        cell?.potfolio = portFolioArr[indexPath.row]
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       let screenSize = UIScreen.main.bounds.size.width - 30
       return CGSize(width: screenSize/2, height: screenSize/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
   
}
