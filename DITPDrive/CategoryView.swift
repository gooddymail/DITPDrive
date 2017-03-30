//
//  CategoryView.swift
//  DITPDrive
//
//  Created by Katchapon Poolpipat on 3/30/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit

class CategoryView: UIView {
  let categoryNameLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 2
    label.font = TextStyle.mainCategory.font
    label.textColor = TextStyle.mainCategory.color
    label.adjustsFontSizeToFitWidth = true
    return label
  }()
  
  let categoryImageView: UIImageView = {
    let imageView = UIImageView()
    return imageView
  }()
  
  init() {
    super.init(frame: CGRect(x: 0, y: 0, width: 153, height: 64))
    backgroundColor = UIColor.white
    let views: [String: UIView] = ["categoryNameLabel": categoryNameLabel, "categoryImageView": categoryImageView]
    addAutoLayoutSubviews(views)
    addConstraints(withVisualFormat: "H:|-0-[categoryImageView]-0-|", views: views)
    addConstraints(withVisualFormat: "V:|-0-[categoryImageView]-0-|", views: views)
    sendSubview(toBack: categoryImageView)
    addConstraints(withVisualFormat: "H:|-5-[categoryNameLabel]-5-|", views: views)
    addConstraints(withVisualFormat: "V:|-5-[categoryNameLabel]-5-|", views: views)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
