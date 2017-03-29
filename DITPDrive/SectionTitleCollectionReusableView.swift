//
//  SectionTitleCollectionReusableView.swift
//  DITPDrive
//
//  Created by Katchapon Poolpipat on 3/27/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit

class SectionTitleCollectionReusableView: UICollectionReusableView {
  @IBOutlet weak var titleLabel: UILabel!
  
  class func identifier() -> String {
    return "sectiontitleHeader"
  }
        
}
