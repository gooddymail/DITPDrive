//
//  IntroContainerViewController.swift
//  DITPDrive
//
//  Created by Katchapon Poolpipat on 3/13/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit

class IntroContainerViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func skipTapped(_ sender: Any) {
    
    guard let appDelegate = UIApplication.shared.delegate,
      let window = appDelegate.window else {
        return
    }
    
    UIView.transition(with: window! , duration: 0.3, options: .transitionCrossDissolve, animations: {
      let tabbarController = UITabBarController()
      tabbarController.tabBar.tintColor = UIColor(red:0.98, green:0.69, blue:0.25, alpha:1.0)
      tabbarController.tabBar.barTintColor = UIColor(red:0.00, green:0.02, blue:0.15, alpha:1.0)
      tabbarController.viewControllers = [UIStoryboard.homeStoryboard().instantiateViewController(withIdentifier: "home")]
      window!.rootViewController = tabbarController
    }, completion: nil)
  }
  
}
