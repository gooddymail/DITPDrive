//
//  Theme.swift
//  DITPDrive
//
//  Created by Katchapon Poolpipat on 3/14/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit

// MARK: - ApplicationColor enum

public enum ApplicationColor {
  case yellow
  case purple
  case blue
  
  var rgba: [CGFloat] {
    switch self {
    case .yellow: return [200.0 / 255.0, 200.0 / 255.0, 200.0 / 255.0, 1.0]
    case .purple: return [0.0 / 255.0, 4.0 / 255.0, 38.0 / 255.0, 1.0]
    case .blue: return [32.0 / 255.0, 129.0 / 255.0, 241.0 / 255.0, 1.0]
    }
  }
  
  var r: CGFloat { return self.rgba[0] }
  var g: CGFloat { return self.rgba[1] }
  var b: CGFloat { return self.rgba[2] }
  var a: CGFloat { return self.rgba[3] }
		
}

// MARK: - UIColor extension

extension UIColor {
  
  convenience init(applicationColor: ApplicationColor) {
    self.init(red: applicationColor.r, green: applicationColor.g, blue: applicationColor.b, alpha: applicationColor.a)
  }
}

public enum TextStyle {
  
  case mainCategory
  case attachmentButton
  
  public var font: UIFont {
    
    switch self {
    case .mainCategory: return UIFont(name: "Prompt-Medium", size: 16.0)!
    case .attachmentButton: return UIFont(name: "Prompt-Medium", size: 14)!
    }
  }
  
  public var color: UIColor {
    
    switch self {
    case .mainCategory: return UIColor.white
    case .attachmentButton: return UIColor(applicationColor: .blue)
    }
  }
}
