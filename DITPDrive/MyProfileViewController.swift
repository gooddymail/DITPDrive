//
//  MyProfileViewController.swift
//  DITPDrive
//
//  Created by Katchapon on 4/11/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit

class MyProfileViewController: ApplicationBaseViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  class func controller() -> MyProfileViewController {
    guard let controller = UIStoryboard.myProfileStoryboard().instantiateViewController(withIdentifier: "MyProfileViewController") as? MyProfileViewController else {
      fatalError("Something wrong should have view controller here")
    }
    return controller
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
