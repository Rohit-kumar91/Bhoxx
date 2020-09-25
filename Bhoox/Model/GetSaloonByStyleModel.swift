//
//  GetSaloonByCategoryModel.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 15/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import Foundation

class GetSaloonByStyle: Codable {
    var id: String?
    var cat_id: String?
    var salon_id: String?
    var parent_id: String?
    var subcat_id: String?
    var service_id: String?
    var details: String?
    var title: String?
    var price: String?
    var nodes: [Nodes]?
    var opened: Bool?
    var timeto: String?
    
}

class Nodes: Codable {
    var id: String?
    var cat_id: String?
    var salon_id: String?
    var parent_id: String?
    var subcat_id: String?
    var service_id: String?
    var timeto: String?
    var details: String?
    var created_at: String?
    var title: String?
    var price: String?
    var timefrom: String?
    var special_price: String?
}
