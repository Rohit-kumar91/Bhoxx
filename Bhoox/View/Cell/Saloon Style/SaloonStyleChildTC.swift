//
//  SaloonStyleChildTC.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 16/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import UIKit

class SaloonStyleChildTC: UITableViewCell {
    
    @IBOutlet weak var lblDetial: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblSpecialPrice: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
