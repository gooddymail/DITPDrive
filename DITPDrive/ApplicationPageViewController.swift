//
//  ApplicationPageViewController.swift
//  DITPDrive
//
//  Created by Katchapon Poolpipat on 3/14/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit

class ApplicationPageViewController: UIPageViewController {
  
  var contentViewControllers: [UIViewController]?
  
  convenience init(contentViewControllersInPageView contentViewControllers: [UIViewController]?) {
    self.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    self.contentViewControllers = contentViewControllers
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupPageControlContent()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    if let pageScrollView = view.subviews.first {
      pageScrollView.frame = view.bounds
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
  }
  
  fileprivate func setupPageControlContent() {
    dataSource = self
    
    if let contentViewControllers = contentViewControllers {
      setViewControllers([contentViewControllers.first!],
                         direction: .forward,
                         animated: true,
                         completion: nil)
    }
  }
  
  
}

// MARK: - UIPageViewControllerDataSource

extension ApplicationPageViewController: UIPageViewControllerDataSource {
  
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    guard let contentViewControllers = contentViewControllers else {
      return 0
    }
    return contentViewControllers.count
  }
  
  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    guard let firstViewController = viewControllers?.first,
          let contentViewControllers = contentViewControllers,
          let firstViewControllerIndex = contentViewControllers.index(of: firstViewController) else {
        return 0
    }
    
    return firstViewControllerIndex
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    
    guard let contentViewControllers = contentViewControllers,
          let viewControllerIndex = contentViewControllers.index(of: viewController) else {
      return nil
    }
    
    let previousIndex = viewControllerIndex - 1
    
    guard previousIndex >= 0  else {
      return contentViewControllers.last
    }
    
    guard contentViewControllers.count > previousIndex else {
      return nil
    }
    
    return contentViewControllers[previousIndex]
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    
    guard let contentViewControllers = contentViewControllers,
          let viewControllerIndex = contentViewControllers.index(of: viewController) else {
      return nil
    }
    
    let nextIndex = viewControllerIndex + 1
    
    guard contentViewControllers.count != nextIndex else {
      return contentViewControllers.first
    }
    
    guard contentViewControllers.count > nextIndex else {
      return nil
    }
    
    return contentViewControllers[nextIndex]
  }
}
