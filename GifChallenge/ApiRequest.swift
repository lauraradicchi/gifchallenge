//
//  ApiRequest.swift
//  GifChallenge
//
//  Created by Laura Radicchi on 08/09/19.
//  Copyright © 2019 com.LauraRadicchi. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum NetworkError: Error {
    case failure
    case success
}
class ApiRequest{
    
    var searchResults = [JSON]()
    
    func search(searchText: String, completionHandler: @escaping ([JSON]?, NetworkError) -> ()) {
        let urlToSearch = "https://api.thecatapi.com/v1/images/search?limit=100"
        
        Alamofire.request(urlToSearch).responseJSON { response in
            guard let data = response.data else {
                completionHandler(nil, .failure)
                return
            }
            
            let json = try? JSON(data: data)
            let results = json?["query"]["pages"].arrayValue
            guard let empty = results?.isEmpty, !empty else {
                completionHandler(nil, .failure)
                return
            }
            
            completionHandler(results, .success)
        }
    }
    func fetchImages(url:String, completionHandler: @escaping (UIImage?, NetworkError) -> ()){
        Alamofire.request(url).responseData { responseData in
            
            guard let imageData = responseData.data else {
                completionHandler(nil, .failure)
                return
            }
            
            guard let image = UIImage(data: imageData) else {
                completionHandler(nil, .failure)
                return
            }
            
            completionHandler(image, .success)
        }
    }
}


