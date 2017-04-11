//
//  ActivityDocumentTableViewCell.swift
//  DITPDrive
//
//  Created by Nuttapon Achachotipong on 4/7/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit

class ActivityDocumentTableViewCell: UITableViewCell {
  @IBOutlet weak var documentContainerView: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    let attachmentView = AttachmentDocumentView()
    let views: [String: UIView] = ["attachmentView": attachmentView]
    
    documentContainerView.addAutoLayoutSubviews(views)
    documentContainerView.addConstraints(withVisualFormat: "V:|-0-[attachmentView]-0-|", views: views)
    documentContainerView.addConstraints(withVisualFormat: "H:|-0-[attachmentView]-0-|", views: views)
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  class func identifier() -> String {
    return "ActivityDocumentTableViewCell"
  }
  
}
