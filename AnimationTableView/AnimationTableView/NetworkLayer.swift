//
//  NetworkLayer.swift
//  AnimationTableView
//
//  Created by Hiem Seyha on 6/5/18.
//  Copyright © 2018 Hiem Seyha. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol NetworkType {
  
   func get<T: SwiftyJSONDecode>(type: T.Type, completed: @escaping (_ result: T?) -> Void)
}




class NetworkLayer: NetworkType {
   
   let url = "https://httpbin.org/get"
   
   func get<T: SwiftyJSONDecode>(type: T.Type, completed: @escaping (_ result: T?) -> Void) {
      
      Alamofire.request(url, method: .get).validate().responseJSON { response in
         switch response.result {
         case .success(let value):
            
            let json = JSON(value)
            let dictionary = json.dictionaryValue
            
          
             let result = T(json: dictionary)
             completed(result)
            
            
         case .failure(let error):
            print(error)
         }
      }
      
   }
}
