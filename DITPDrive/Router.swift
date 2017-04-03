//
//  Router.swift
//  DITPDrive
//
//  Created by Katchapon Poolpipat on 3/6/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
  
  // MARK: - Case
  case activity(page: Int?)
  case homeActivities
  
  // MARK: - BaseURL
  static let baseURL: URL = URL(string: "https://ditpdrive.com")!
  
  var path: String {
    switch self {
      case .activity(_): return "/activities/"
      case .homeActivities: return "/activities/home"
    }
  }
  
  var httpMethod: Alamofire.HTTPMethod {
    switch self {
      case .activity(_): return .get
      case .homeActivities: return .get
    }
  }
  
  var parameters: [String: Any]? {
    switch self {
      case .activity(let page): return ["page": page ?? 1]
      default: return nil
    }
  }
  
  func asURLRequest() throws -> URLRequest {
    let url: URL = Router.baseURL.appendingPathComponent(self.path)
    var request = URLRequest(url: url)
    request.httpMethod = self.httpMethod.rawValue
    
    return try URLEncoding.default.encode(request, with: self.parameters)
  }
}
