//
//  ActivityContactInfoTableViewCell.swift
//  DITPDrive
//
//  Created by Nuttapon Achachotipong on 4/7/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit

class ActivityContactInfoTableViewCell: UITableViewCell {
  @IBOutlet weak var responderDepartmentNameLabel: UILabel!
  @IBOutlet weak var contactorNameLabel: UILabel!
  @IBOutlet weak var telButton: UIButton!
  @IBOutlet weak var emailButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  class func identifier() -> String {
    return "ActivityContactInfoTableViewCell"
  }
  
}
