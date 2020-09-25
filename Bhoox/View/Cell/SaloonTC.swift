//
//  SaloonTC.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 11/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import UIKit
import Nuke

protocol SaloonTCDelegate: class {
    func buttonTapped(index: Int)
}

class SaloonTC: UITableViewCell {
    
    @IBOutlet weak var imgSaloon: UIImageViewX!
    @IBOutlet weak var lblSaloonName: UILabel!
    @IBOutlet weak var lblSaloonAddress: UILabel!
    @IBOutlet weak var btnShowAllSerices: UIButton!
    
    var delegate: SaloonTCDelegate? = nil
    
    var data: GetCategoryByIDModel? {
        didSet {
            if let url = URL(string: /data?.salon_image) {
                Nuke.loadImage(with: url, into: imgSaloon)
            }
            
            lblSaloonName.text = data?.shop_name
            lblSaloonAddress.text = data?.shop_address
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func btnShowAllServices(_ sender: UIButton) {
        delegate?.buttonTapped(index: sender.tag)
    }
}
