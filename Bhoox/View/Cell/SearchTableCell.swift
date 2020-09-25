//
//  SearchTableCell.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 25/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import UIKit

class SearchTableCell: UITableViewCell {
    
    //MARK: OUTLETS
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var slectionImage: UIImageView!
    
    //MARK: Properties
    var cities: Cities? {
        didSet {
            lblTitle.text = cities?.city
            if /cities?.isSelected {
                slectionImage.isHidden = false
            } else {
                slectionImage.isHidden = true
            }
            
        }
    }
    
    
    var category: ResponseData? {
        didSet {
            lblTitle.text = category?.cat_name
            
            if /category?.isSelected {
                slectionImage.isHidden = false
            } else {
                slectionImage.isHidden = true
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
