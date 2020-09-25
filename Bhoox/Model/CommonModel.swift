//
//  CommonModel.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 08/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import Foundation

class CommonModel<T: Codable>: Codable {
    var ResponseMessage: String?
    var ResponseData: [T]?
    var ResponseType: String?
}


class CommonModel2: Codable {
    var ResponseMessage: String?
    var ResponseData: [BannerData]?
    var ResponseSalonData: [SaloonData]?
    var ResponseType: String?
}
