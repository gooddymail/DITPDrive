//
//  HomeActivityCollectionViewCell.swift
//  DITPDrive
//
//  Created by Katchapon Poolpipat on 3/27/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit

class HomeActivityCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var activityThumbnailImageView: UIImageView!
  @IBOutlet weak var activityNameLabel: UILabel!
  @IBOutlet weak var activityDateLabel: UILabel!
  @IBOutlet weak var activityLocationLabel: UILabel!
  @IBOutlet weak var bookmarkIconImageView: UIImageView!
  
  override func awakeFromNib() {
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
    self.layer.shadowRadius = 2.0
    self.layer.shadowOpacity = 0.5
    self.layer.masksToBounds = false
  }
  
  class func identifier() -> String {
    return "homeActivityCell"
  }
  
}
