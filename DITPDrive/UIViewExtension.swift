//
//  UIViewExtension.swift
//  DITPDrive
//
//  Created by Katchapon Poolpipat on 3/30/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import Foundation

extension UIView {
  
  func addAutoLayoutSubviews(_ subviews: [String: UIView]) {
    for (_, view) in subviews {
      addAutoLayoutSubview(view)
    }
  }
  
  func addAutoLayoutSubview(_ subview: UIView) {
    subview.translatesAutoresizingMaskIntoConstraints = false
    addSubview(subview)
  }
  
  func addConstraints(withVisualFormat visualFormat: String, views: [String: UIView]) {
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: visualFormat, options: [], metrics: nil, views: views))
  }
}
