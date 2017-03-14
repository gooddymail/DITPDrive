//
//  HomeViewController.swift
//  DITPDrive
//
//  Created by Katchapon Poolpipat on 3/9/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  @IBOutlet weak var hightlightActivityContainerView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    setupHighlightActivityPageView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
  }
  
  fileprivate func setupHighlightActivityPageView() {
    let highlightActivityPageViewController = ApplicationPageViewController(contentViewControllersInPageView: [highlightActivityViewController(),
         highlightActivityViewController(),
         highlightActivityViewController()])
    
    addChildViewController(highlightActivityPageViewController)
    highlightActivityPageViewController.view.frame = hightlightActivityContainerView.frame
    hightlightActivityContainerView.addSubview(highlightActivityPageViewController.view)
    highlightActivityPageViewController.didMove(toParentViewController: self)
  }
  
  fileprivate func highlightActivityViewController() -> UIViewController {
    return storyboard!.instantiateViewController(withIdentifier: "HighlightActivity")
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
