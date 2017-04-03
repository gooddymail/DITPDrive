//
//  HomeActivitiesWrapper.swift
//  DITPDrive
//
//  Created by Katchapon Poolpipat on 4/3/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import Foundation

struct HomeActivitiesWrapper {
  let highlightActivities: [Activity]
  let nationalActivities: [Activity]
  let overseaActivities: [Activity]
  let seminar: [Activity]
  
  public init?(json: [String: Any]) throws {
    guard let highlightActivities = json["highlight"] as? [[String: Any]],
      let nationalActivities = json["national_event"] as? [[String: Any]],
      let overseaActivities = json["oversea_event"] as? [[String: Any]],
      let seminar = json["seminar"] as? [[String: Any]] else {
        throw SerializarionError.missing("Some of data is missing")
    }
    //Something not right here should be refactor
    self.highlightActivities =  highlightActivities.map { try! Activity(json: $0)! }
    self.overseaActivities = overseaActivities.map { try! Activity(json: $0)! }
    self.nationalActivities = nationalActivities.map { try! Activity(json: $0)! }
    self.seminar = seminar.map { try! Activity(json: $0)! }
  }
}
