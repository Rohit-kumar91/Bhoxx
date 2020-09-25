//
//  APIConstant.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 06/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import Foundation

internal struct APIConstant {
    
    //Server
    static let basePath = "https://novos.in/bhooxsalon/API/Bhoox"
    
    static let registeration = "/registration"
    static let login = "/login"
    static let categories = "/categories"
    static let getsaloonbycategory = "/getsaloonbycategory"
    static let getsaloonbanners = "/getsaloonbanners"
    static let getsaloonstyles = "/getsaloonstyles"
    static let getsaloonsubdata = "/getsaloonsubdata"
    static let getsaloonportfolio = "/getsaloonportfolio"
    static let cities = "/cities"


}

typealias OptionalDictionary = [String : Any]?
extension Sequence where Iterator.Element == Keys {
    func map(values: [Any?]) -> OptionalDictionary {
        var params = [String : Any]()
        
        for (index,element) in zip(self,values) {
            if let element = element {
                params[index.rawValue] = element
            }
        }
        return params
    }
}

enum Keys: String {
    typealias RawValue = String
    case first_name
    case last_name
    case email
    case password
    case gender
    case postcode
    case limit
    case cat_id
    case start
    case salon_id
    
}

struct Parameters {
    static let registeration: [Keys] = [.first_name, .last_name, .email, .password, .gender, .postcode]
    static let login: [Keys] = [.email, .password]
    static let categories: [Keys] = [.limit]
    static let getsaloonbycategory: [Keys] = [.cat_id, .start, .limit]
    static let getsaloonbanners: [Keys] = [.salon_id]
    static let getsaloonstyles: [Keys] = [.salon_id]
    static let getsaloonsubdata: [Keys] = [.salon_id, .cat_id]
    static let getsaloonportfolio: [Keys] = [.salon_id]
    static let cities: [Keys] = [.limit]
}
