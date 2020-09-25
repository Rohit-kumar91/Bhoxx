//
//  CategoryCC.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 07/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import UIKit
import Nuke

class CategoryCC: UICollectionViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var lblCategoryName: UILabel!
    
    var category: ResponseData? {
        didSet {
            if let url = URL(string: /category?.cat_image) {
                Nuke.loadImage(with: url, into: categoryImage)
            }
            
            lblCategoryName.text = category?.cat_name
        }
    }
    
    
    var potfolio: PortfolioModel? {
        didSet {
            if let url = URL(string: /potfolio?.image) {
                Nuke.loadImage(with: url, into: categoryImage)
            }
            
            lblCategoryName.text = ""
        }
    }
    
    
    
}
