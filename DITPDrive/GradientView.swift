//
//  GradientView.swift
//  DITPDrive
//
//  Created by Katchapon Poolpipat on 4/3/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit

class GradientView: UIView {
  override open class var layerClass: AnyClass {
    get {
      return CAGradientLayer.classForCoder()
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    let gradientLayer = self.layer as! CAGradientLayer
    gradientLayer.colors = [UIColor(white: 0, alpha: 0.5).cgColor, UIColor(white: 0, alpha: 0).cgColor]
    
  }

}
