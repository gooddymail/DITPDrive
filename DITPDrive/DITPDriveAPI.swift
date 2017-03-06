//
//  DITPDriveAPI.swift
//  DITPDrive
//
//  Created by Katchapon Poolpipat on 3/6/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import Foundation
import Alamofire

final class DITPDriveAPI {
  
  static let instance: DITPDriveAPI = DITPDriveAPI()
  
  fileprivate init() {}
  
  func getActivities(_ wrapper: ActivitiesWrapper?, completionHandler: @escaping (Result<ActivitiesWrapper>) -> Void) {
    self.activities(atPage: wrapper?.page, completionHandler: completionHandler)
  }
  
  fileprivate func activities(atPage page: Int? = 1, completionHandler: @escaping (Result<ActivitiesWrapper>) -> Void) {
    Alamofire.request(Router.activity(page: page)).responseJSON { [weak self] response in
      if let error = response.result.error {
        completionHandler(.failure(error))
        return
      }
      guard let weakSelf = self else {
        completionHandler(.failure(DITPDriveError.objectSerialization(reason: "Somthing went wrong")))
        return
      }
      let activitiesWrapperResult = weakSelf.activities(fromResponse: response)
      completionHandler(activitiesWrapperResult)
    }
  }
  
  fileprivate func activities(fromResponse response: DataResponse<Any>) -> Result<ActivitiesWrapper> {
    guard response.result.error == nil else {
      return .failure(response.result.error!)
    }
    
    guard let json = response.result.value as? [String: Any] else {
      return .failure(DITPDriveError.objectSerialization(reason: "Did not get JSON from response"))
    }
    
    let wrapper: ActivitiesWrapper = ActivitiesWrapper()
    wrapper.nextPage = json["next"] as? String
    wrapper.count = json["count"] as? Int
    
    var activities: [Activity] = []
    if let results = json["results"] as? [[String: Any]] {
      for json in results {
        let activity: Activity
        do {
          activity = try Activity(json: json)!
          activities.append(activity)
        } catch {
          return .failure(error)
        }
      }
    }
    wrapper.activities = activities
    return .success(wrapper)
  }
}
