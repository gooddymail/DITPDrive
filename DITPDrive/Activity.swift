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
  public let id: Int
  public let startDate: String
  public let endDate: String
  public let eventPlace: String
  public let eventDescription: String
  public let favorite: Bool
  public let responsibleDepartment: String?
  public let tel: String?
  public let contactPerson: String?
  public let thumbnailImage: URL?
  public let bannerImage: URL?
  public let available: Int?
  public let type: String?
  
  public init?(json: [String: Any]) throws {
    
    guard let name = json["name"] as? String,
          let id = json["id"] as? Int,
          let startDate = json["register_start_date"] as? String,
          let endDate = json["register_end_date"] as? String,
          let eventPlace = json["fair_location"] as? String,
          let eventDescription = json["description"] as? String,
          let thumbnailImage = json["thumbnail_image"] as? String,
          let bannerImage = json["banner_image"] as? String,
          let favorite = json["favorite"] as? Bool else {
      throw SerializarionError.missing("important Information")
    }
    
    self.name = name
    self.id = id
    self.startDate = startDate
    self.endDate = endDate
    self.eventPlace = eventPlace
    self.eventDescription = eventDescription
    self.thumbnailImage = URL(string: thumbnailImage)
    self.bannerImage = URL(string: bannerImage)
    self.favorite = favorite
    
    self.responsibleDepartment = json["responsible-department"] as! String?
    self.tel = json["tel"] as! String?
    self.contactPerson = json["contact-person"] as! String?
    self.type = json["activity_type"] as! String?
    self.available = json["available"] as! Int?
  }
}
