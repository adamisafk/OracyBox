//
//  NetworkingClient.swift
//  OracyBox
//
//  Created by Adam Howells on 02/03/2020.
//  Copyright © 2020 Adam Howells. All rights reserved.
//

import Foundation
import Alamofire

class NetworkingClient {
    
    typealias WebServiceResponse = ([[String: Any]]?, Error?) -> Void
    
    func execute(_ url: URL, completion: @escaping WebServiceResponse) {
        Alamofire.request(url).validate().responseJSON { response in
            if let error = response.error {
                completion(nil, error)
            } else if let jsonArray = response.result.value as? [[String: Any]] {
                completion(jsonArray, nil)
            } else if let jsonDict = response.result.value as? [String: Any] {
                completion([jsonDict], nil)
            }
        }
        
    }
    
}
