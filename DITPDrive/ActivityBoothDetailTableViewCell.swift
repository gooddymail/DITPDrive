//
//  ActivityBoothDetailTableViewCell.swift
//  DITPDrive
//
//  Created by Nuttapon Achachotipong on 4/7/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit

class ActivityBoothDetailTableViewCell: UITableViewCell {
  @IBOutlet weak var boothCapacityLabel: UILabel!
  @IBOutlet weak var boothPriceLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  class func identifier() -> String {
    return "ActivityBoothDetailTableViewCell"
  }
  
}
