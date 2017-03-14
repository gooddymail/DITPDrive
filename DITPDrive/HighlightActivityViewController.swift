//
//  HighlightActivityViewController.swift
//  DITPDrive
//
//  Created by Katchapon Poolpipat on 3/14/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit
import SDWebImage

class HighlightActivityViewController: UIViewController {
  
  @IBOutlet weak var highlightImageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    highlightImageView.sd_setImage(with: URL(string: "http://lorempixel.com/375/160/cats/"), placeholderImage: nil)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
  
}
