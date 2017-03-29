//
//  HighlightAndCategoryViewController.swift
//  DITPDrive
//
//  Created by Katchapon Poolpipat on 3/29/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit

class HighlightAndCategoryViewController: UIViewController {
  @IBOutlet weak var highlightActivityContainerView: UIView!
  

    override func viewDidLoad() {
        super.viewDidLoad()

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
    highlightActivityPageViewController.view.frame = CGRect(x: 0, y: 0, width: highlightActivityContainerView.frame.size.width, height: highlightActivityContainerView.frame.size.height)
    highlightActivityContainerView.addSubview(highlightActivityPageViewController.view)
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
