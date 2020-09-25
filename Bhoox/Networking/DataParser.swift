//
//  DataParser.swift
//  Bhoox
//
//  Created by Rohit Prajapati on 06/09/20.
//  Copyright © 2020 Rohit Prajapati. All rights reserved.
//

import Foundation
import Moya

extension TargetType {
    
    func parseModel(data: Data) -> Any? {
        switch self {
            
        case is EndPoint:
            let endpoint = self as! EndPoint
            switch endpoint {
            case .registeration:
                return nil
            case .login:
                return nil
            
            case .categories:
                return JSONHelper<CommonModel<ResponseData>>().getCodableModel(data: data)?.ResponseData
                
            case .getsaloonbycategory:
                return JSONHelper<CommonModel<GetCategoryByIDModel>>().getCodableModel(data: data)?.ResponseData
                
            case .getsaloonbanners:
                 return JSONHelper<CommonModel2>().getCodableModel(data: data)
            
            case .getsaloonstyles:
                return JSONHelper<CommonModel<GetSaloonByStyle>>().getCodableModel(data: data)?.ResponseData
                
            case .getsaloonsubdata:
                return nil
                
            case .getsaloonportfolio:
                return JSONHelper<CommonModel<PortfolioModel>>().getCodableModel(data: data)?.ResponseData
                
            case .cities:
                return JSONHelper<CommonModel<Cities>>().getCodableModel(data: data)?.ResponseData

            }
                        
        default:
            return nil
        }
    }
}
