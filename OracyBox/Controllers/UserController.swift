//
//  UserController.swift
//  OracyBox
//
//  Created by Adam Howells on 06/03/2020.
//  Copyright © 2020 Adam Howells. All rights reserved.
//

import Foundation
import Alamofire
import Alamofire_SwiftyJSON
import SwiftyJSON
import KeychainSwift

class UserController {
    func getUser(token: String, prefix: String) {
        let keychain = KeychainSwift(keyPrefix: prefix)
        let headers = [
            "Authorization": "Bearer " + token
        ]
        
        Alamofire.request(Keys.baseURL + "user", method: .get, headers: headers).responseSwiftyJSON { (response) in
            print(response)
            let json = try! JSON(data: response.data!)
            keychain.set(json["id"].stringValue, forKey: Keys.id)
            keychain.set(json["name"].stringValue, forKey: Keys.name)
        }
    }
}
