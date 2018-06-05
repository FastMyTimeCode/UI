//
//  TestModel.swift
//  AnimationTableView
//
//  Created by Hiem Seyha on 6/5/18.
//  Copyright © 2018 Hiem Seyha. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol SwiftyJSONDecode {
    init(json: [String:JSON])
}

struct TestModel: SwiftyJSONDecode {
   let origin: String
   let url: String
   
   init(json: [String:JSON]) {
      origin = (json["origin"]?.stringValue)!
      url = (json["url"]?.stringValue)!
   }
}
