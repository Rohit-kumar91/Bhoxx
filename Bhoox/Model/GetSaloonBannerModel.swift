
//
//  GetSaloonBannerModel.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 14/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import Foundation


class OperationalHours: Codable {
    var end: String?
    var close: String?
    var day: String?
    var start: String?
}

class SaloonData: Codable {
    var usr_image: String?
    var shop_description: String?
    var operating_hours: [OperationalHours]?
    var shop_longitude: String?
    var shop_latitude: String?
    var rating: String?
    var shop_name: String?
    
}


class BannerData: Codable {
    var id: String?
    var title: String?
    var salon_id: String?
    var image: String?
    
}
