//
//  CurriculumController.swift
//  OracyBox
//
//  Created by Adam Howells on 07/03/2020.
//  Copyright © 2020 Adam Howells. All rights reserved.
//

import Foundation
import KeychainSwift
import Alamofire
import Alamofire_SwiftyJSON
import SwiftyJSON

class CurriculumController {
    let baseURL = Keys.baseURL
    
    func getSubjects(completionHandler: @escaping (JSON) -> Void) {
        guard let token = KeychainSwift(keyPrefix: Keys.prefix1).get(Keys.token) else {
            return
        }
        let headers = [
            "Authorization": "Bearer " + token,
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "application/json"
        ]
        Alamofire.request(baseURL + "subjects", method: .get, headers: headers).validate().responseSwiftyJSON { (response) in
            print(response)
            let json = try! JSON(data: response.data!)
            completionHandler(json)
        }
    }
    
    
    
    func getTopics(subjectId: String, completionHandler: @escaping (JSON) -> Void) {
        guard let token = KeychainSwift(keyPrefix: Keys.prefix1).get(Keys.token) else {
            return
        }
        let headers = [
            "Authorization": "Bearer " + token,
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "application/json"
        ]
        let parameters = [
            "subject_id": subjectId
        ]
        Alamofire.request(baseURL + "topics", method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: headers).responseSwiftyJSON { (response) in
            let json = try! JSON(data: response.data!)
            completionHandler(json)
        }
    }
    
    
    
    func getActivities(topicId: String, completionHandler: @escaping (JSON) -> Void) {
        guard let token = KeychainSwift(keyPrefix: Keys.prefix1).get(Keys.token) else {
            return
        }
        let headers = [
            "Authorization": "Bearer " + token,
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "application/json"
        ]
        let parameters = [
            "topic_id": topicId
        ]
        Alamofire.request(baseURL + "activities", method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: headers).responseSwiftyJSON { (response) in
            let json = try! JSON(data: response.data!)
            completionHandler(json)
        }
    }
    
    
    
    func postCompletedActivity(activityId: Int, results: JSON, media_path: String, completionHandler: @escaping (JSON) -> Void) {
        guard let token = KeychainSwift(keyPrefix: Keys.prefix1).get(Keys.token) else {
            return
        }
        let headers = [
            "Authorization": "Bearer " + token,
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "application/json"
        ]
        print(activityId)
        print(results)
        print(media_path)
        let parameters = [
            "activity_id": activityId,
            "results": results,
            "media_path": media_path
            ] as [String : Any]
        let otherHeaders = [
            "Authorization": "Bearer " + token,
            "Content-Type": "application/x-www-form-urlencoded",
            "Accept": "application/json"
        ]
        Alamofire.request(baseURL + "completed-activities/create", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: otherHeaders).responseSwiftyJSON { (response) in
            print(response)
            print(response.data!)
            let json = try! JSON(data: response.data!)
            completionHandler(json)
        }
    }
}
