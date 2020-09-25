//
//  NetworkAdapter.swift
//  AE
//
//  Created by MAC_MINI_6 on 16/04/19.
//  Copyright © 2019 MAC_MINI_6. All rights reserved.
//

import Foundation
import Moya
import RMessage

private func JSONResponseDataFormatter(_ data: Data) -> Data {
  do {
    let dataAsJSON = try JSONSerialization.jsonObject(with: data)
    let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
    return prettyData
  } catch {
    return data // fallback to original data if it can't be serialized.
  }
}


extension TargetType {
    
    func provider<T: TargetType>() -> MoyaProvider<T> {
        
        return MoyaProvider<T>(plugins: [(NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter))])

    }
    
    func request(isLoader: Bool, success successCallBack: @escaping (Any?) -> Void, error errorCallBack: ((String?) -> Void)? = nil) {
        
        if isLoader {
            Utility.shared.showLoader()
        }
        
        
        provider().request(self) { (result) in
            //Hide Loader after getting response
            
            if isLoader {
                Utility.shared.hideLoader()
            }
            
            
            switch result {
            case .success(let response):
                switch response.statusCode {
                    
                case 200, 201:
                    let model = self.parseModel(data: response.data)
                    successCallBack(model)
                    
                case 401, 403:
                    
                    Utility.shared.hideLoader()
                    UDSingleton.shared.tokenExpired()
                    do {
                        let json = try JSONSerialization.jsonObject(with: response.data, options: []) as? [String : Any]
                        CustomAlert.shared.show(alert: "Bhoox", message:  /(json?["message"] as? String), withSpec: errorSpec)
                        errorCallBack?(/(json?["message"] as? String))
                    } catch {
                        CustomAlert.shared.show(alert: "Bhoox", message:  error.localizedDescription, withSpec: errorSpec)
                    }
                    
                    
                    
                case 400, 409, 500:
                    Utility.shared.hideLoader()
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: response.data, options: []) as? [String : Any]
                        CustomAlert.shared.show(alert: "Bhoox", message:  /(json?["message"] as? String), withSpec: errorSpec)
                        errorCallBack?(/(json?["message"] as? String))
                    } catch {
                        CustomAlert.shared.show(alert: "Bhoox", message:  error.localizedDescription, withSpec: errorSpec)
                    }
                    
                    
                    
                default:
                    Utility.shared.hideLoader()
                    CustomAlert.shared.show(alert: "Bhoox", message:  "Error Default", withSpec: errorSpec)
                }
                
            case .failure(let error):
                Utility.shared.hideLoader()
                CustomAlert.shared.show(alert: "Bhoox", message:  error.localizedDescription, withSpec: errorSpec)
                errorCallBack?(error.localizedDescription)
            }
        }
    }
}
