//
//  ActivityDescriptionTableViewCell.swift
//  DITPDrive
//
//  Created by Katchapon Poolpipat on 4/4/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit

class ActivityDescriptionTableViewCell: UITableViewCell {
  @IBOutlet weak var descriptionLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  class func identifier() -> String {
    return "ActivityDescriptionTableViewCell"
  }
  
}
