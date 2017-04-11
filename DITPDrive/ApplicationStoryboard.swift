//
//  ApplicationStoryboard.swift
//  DITPDrive
//
//  Created by Katchapon Poolpipat on 3/13/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
  
  class func mainStoryboard() -> UIStoryboard {
    return UIStoryboard(name: "Main", bundle: nil)
  }
  
  class func homeStoryboard() -> UIStoryboard {
    return UIStoryboard(name: "Home", bundle: nil)
  }
  
  class func activityDetailStoryboard() -> UIStoryboard {
    return UIStoryboard(name: "ActivityDetailStoryboard", bundle: nil)
  }
  
  class func myProfileStoryboard() -> UIStoryboard {
    return UIStoryboard(name: "MyProfileStoryboard", bundle: nil)
  }
  
  class func myApplicationStoryboard() -> UIStoryboard {
    return UIStoryboard(name: "MyApplicationStoryboard", bundle: nil)
  }
  
  class func categoryStoryboard() -> UIStoryboard {
    return UIStoryboard(name: "CategoryStoryboard", bundle: nil)
  }
}
