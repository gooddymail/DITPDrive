//
//  ActivityDetailTableViewCell.swift
//  DITPDrive
//
//  Created by Katchapon Poolpipat on 4/4/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit

class ActivityDetailTableViewCell: UITableViewCell {
  @IBOutlet weak var activityNameLabel: UILabel!
  @IBOutlet weak var eventStartDateLabel: UILabel!
  @IBOutlet weak var eventStartTimeLabel: UILabel!
  @IBOutlet weak var registerDateLabel: UILabel!
  @IBOutlet weak var eventNamePlaceLabel: UILabel!
  @IBOutlet weak var prodctGroupScrollView: UIScrollView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowOffset = CGSize(width: 0, height: 3.0)
    self.layer.shadowRadius = 2.0
    self.layer.shadowOpacity = 0.5
    self.layer.masksToBounds = false
    self.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  class func identifier() -> String {
    return "ActivityDetailTableViewCell"
  }
  
}
