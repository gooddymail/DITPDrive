//
//  Activity.swift
//  DITPDrive
//
//  Created by Katchapon Poolpipat on 2/27/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import Foundation


struct Activity {
  
  public let name: String
  public let type: String
  public let id: Int
  public let startDate: String
  public let endDate: String
  public let available: Int
  public let eventPlace: String
  public let eventDescription: String
  public let responsibleDepartment: String?
  public let tel: String?
  public let contactPerson: String?
  
  public init?(json: [String: Any]) throws {
    
    guard let name = json["name"] as? String,
          let type = json["type"] as? String,
          let id = json["id"] as? Int,
          let startDate = json["start-date"] as? String,
          let endDate = json["end-date"] as? String,
          let available = json["available"] as? Int,
          let eventPlace = json["event-place"] as? String,
          let eventDescription = json["description"] as? String else {
      throw SerializarionError.missing("important Information")
    }
    
    self.name = name
    self.type = type
    self.id = id
    self.startDate = startDate
    self.endDate = endDate
    self.available = available
    self.eventPlace = eventPlace
    self.eventDescription = eventDescription
    
    self.responsibleDepartment = json["responsible-department"] as! String?
    self.tel = json["tel"] as! String?
    self.contactPerson = json["contact-person"] as! String?
  }
}
