//
//  ApiModel.swift
//  GifChallenge
//
//  Created by Laura Radicchi on 08/09/19.
//  Copyright © 2019 com.LauraRadicchi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiModel{
    var cat = [Cat]()
    func requesCatApiData(){
        Alamofire.request(.GET, method: "https://api.thecatapi.com/v1/images/search?limit=100").responseJSON { response in
            
    }
}
