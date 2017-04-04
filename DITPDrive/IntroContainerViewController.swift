//
//  IntroContainerViewController.swift
//  DITPDrive
//
//  Created by Katchapon Poolpipat on 3/13/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit

class IntroContainerViewController: ApplicationBaseViewController {
  
  @IBOutlet weak var introStepContainerView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupIntroPageView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  fileprivate func setupIntroPageView() {
    let introStepPageViewController = ApplicationPageViewController(contentViewControllersInPageView: [self.introStepViewController(withIdentifier: "step1"),
                                                                                                       self.introStepViewController(withIdentifier: "step2"),
                                                                                                       self.introStepViewController(withIdentifier: "step3")])
    addChildViewController(introStepPageViewController)
    introStepPageViewController.view.frame = introStepContainerView.frame
    introStepContainerView.addSubview(introStepPageViewController.view)
    introStepPageViewController.didMove(toParentViewController: self)
  }
  
  fileprivate func introStepViewController(withIdentifier identifier: String) -> UIViewController {
    
    return UIStoryboard.mainStoryboard().instantiateViewController(withIdentifier: identifier)
  }
  
  // MARK: - Action
  
  @IBAction func skipTapped(_ sender: Any) {
    
    guard let appDelegate = UIApplication.shared.delegate,
      let window = appDelegate.window else {
        return
    }
    
    UIView.transition(with: window! , duration: 0.3, options: .transitionCrossDissolve, animations: {
      let tabbarController = UITabBarController()
      tabbarController.tabBar.tintColor = UIColor(red:0.98, green:0.69, blue:0.25, alpha:1.0)
      tabbarController.tabBar.barTintColor = UIColor(applicationColor: .purple)
      tabbarController.tabBar.isTranslucent = false
      tabbarController.viewControllers = [UIStoryboard.homeStoryboard().instantiateViewController(withIdentifier: "home")]
      window!.rootViewController = tabbarController
    }, completion: nil)
  }
  
}
