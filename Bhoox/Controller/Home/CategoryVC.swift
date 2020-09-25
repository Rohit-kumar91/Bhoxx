//
//  CategoryVC.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 07/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import UIKit

class CategoryVC: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var categoryCV: UICollectionView!
    
    //MARK:- Properties
    var categories = [ResponseData]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        categoryCV.delegate = self
        categoryCV.dataSource = self

        getCategory()
    }

}

extension CategoryVC {
    
    func getCategory() {
        EndPoint.categories(limit: "10").request(isLoader: true, success: { [weak self] (response) in
            guard let categories = response as? [ResponseData] else { return }
            self?.categories = categories
            ez.runThisInMainThread {
                self?.categoryCV.reloadData()
            }
        })
    }
}

extension CategoryVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCC", for: indexPath) as? CategoryCC
        cell?.category = categories[indexPath.row]
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       let screenSize = UIScreen.main.bounds.size.width - 30
       return CGSize(width: screenSize/2, height: screenSize/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let showCategoryVC = R.storyboard.home.showCategoryVC() else { return }
        showCategoryVC.cat_id = /categories[indexPath.row].cat_id
        pushVC(showCategoryVC)
    }
   
}
