//
//  CategoriesModel.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 07/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import Foundation

class ResponseData: Codable {
    var cat_id: String?
    var sr_no: String?
    var cat_name: String?
    var cat_image: String?
    var created_at: String?
    var updated_at: String?
    var isSelected: Bool?
}

class PortfolioModel: Codable {
    var id: String
    var salon_id: String
    var title: String
    var image : String
    var created_at: String
}
