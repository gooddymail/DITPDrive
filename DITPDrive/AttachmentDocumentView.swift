//
//  AttachmentDocumentView.swift
//  DITPDrive
//
//  Created by Nuttapon Achachotipong on 4/7/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit

class AttachmentDocumentView: UIView {
  private let attachmentIconImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: "attachicon"))
    imageView.contentMode = .scaleAspectFit
    
    return imageView
  }()
  
  let attachmentFileButton: UIButton = {
    let button = UIButton(type: .custom)
    button.titleLabel?.font = TextStyle.attachmentButton.font
    button.titleLabel?.textAlignment = .left
    button.setTitle("1. APPLICATION FORM", for: .normal)
    button.setTitleColor(TextStyle.attachmentButton.color, for: .normal)
    button.setTitleColor(UIColor.lightGray, for: .highlighted)
    button.setTitleColor(UIColor.lightGray, for: .selected)
    button.contentHorizontalAlignment = .left
    
    return button
  }()
  
  init() {
    super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 18))
    
    backgroundColor = UIColor.clear
    let views: [String: UIView] = ["attachmentIconImageView": attachmentIconImageView,
                                   "attachmentFileButton": attachmentFileButton]
    addAutoLayoutSubviews(views)
    addConstraints(withVisualFormat: "V:|-0-[attachmentIconImageView]-0-|", views: views)
    addConstraints(withVisualFormat: "H:|-0-[attachmentIconImageView(12)]-6-[attachmentFileButton]-0-|", views: views)
    addConstraints(withVisualFormat: "V:|-0-[attachmentFileButton]-0-|", views: views)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
