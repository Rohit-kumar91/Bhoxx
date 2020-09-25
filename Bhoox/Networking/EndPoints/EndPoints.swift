//
//  EndPoints.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 06/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import Foundation
import Moya

enum EndPoint {
    case registeration(first_name: String?, last_name: String?, email: String?, password: String?, gender: String?, postcode: String?)
    case login(email: String?, password: String?)
    case categories(limit: String?)
    case getsaloonbycategory(cat_id: String?, start: String?, limit: String?)
    case getsaloonbanners(salon_id: String?)
    case getsaloonstyles(salon_id: String?)
    case getsaloonsubdata(salon_id: String?, cate_id: String?)
    case getsaloonportfolio(salon_id: String?)
    case cities(limit: String?)
}

extension EndPoint: TargetType, AccessTokenAuthorizable {
   
    var authorizationType: AuthorizationType {
        return .bearer
    }
    
    
    var baseURL: URL {
        return URL(string: APIConstant.basePath)!
    }
    
    var path: String {
        switch self {
        case .registeration:
            return APIConstant.registeration
            
        case .login:
            return APIConstant.login
            
        case .categories:
            return APIConstant.categories
            
        case .getsaloonbycategory:
            return APIConstant.getsaloonbycategory
            
        case .getsaloonbanners:
            return APIConstant.getsaloonbanners
            
        case .getsaloonstyles:
            return APIConstant.getsaloonstyles
            
        case .getsaloonsubdata:
            return APIConstant.getsaloonsubdata
            
        case .getsaloonportfolio:
            return APIConstant.getsaloonportfolio
            
        case .cities:
            return APIConstant.cities
        }
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
      return Data()
    }
    
    var task: Task {
       switch self {
       default:
         return Task.requestParameters(parameters: parameters ?? [:], encoding: parameterEncoding)
       }
    }
    
    var headers: [String : String]? {
        return ["authorization": "Basic Qmhvb3hBcHBBUElMb2dpbjpmMzM3M2ZlYTcxNzMxM2U3MmVkMGYxYWIwZWFjN2NhNQ=="]
    }
           
    
    var parameters: [String: Any]? {
        switch self {
        case .registeration(let first_name, let last_name, let email, let password, let gender, let postcode):
            return Parameters.registeration.map(values: [first_name, last_name, email, password, gender, postcode])
       
        case .login(let email, let password):
            return Parameters.login.map(values: [email, password])
            
        case .categories(let limit):
            return Parameters.categories.map(values: [limit])
            
        case .getsaloonbycategory(let cat_id, let start, let limit):
            return Parameters.getsaloonbycategory.map(values: [cat_id, start, limit])
       
        case .getsaloonbanners(let salon_id):
            return Parameters.getsaloonbanners.map(values: [salon_id])
            
        case .getsaloonstyles(let salon_id):
            return Parameters.getsaloonbanners.map(values: [salon_id])
            
        case .getsaloonsubdata(let salon_id, let cate_id):
            return Parameters.getsaloonsubdata.map(values: [salon_id, cate_id])
            
        case .getsaloonportfolio(let salon_id):
            return Parameters.getsaloonportfolio.map(values: [salon_id])
        
        case .cities(let limit):
            return Parameters.cities.map(values: [limit])
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
        
    }
    
    var multipartBody: [MultipartFormData]? {
      switch self {

      default:
        return []
      }
    }
    
}
