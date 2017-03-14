//
//  IntroPageViewController.swift
//  DITPDrive
//
//  Created by Katchapon Poolpipat on 3/13/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit


class IntroPageViewController: UIPageViewController {
  
  fileprivate lazy var introStepViewControllers: [UIViewController] = {
    return [self.introStepViewController(withIdentifier: "step1"),
            self.introStepViewController(withIdentifier: "step2"),
            self.introStepViewController(withIdentifier: "step3")]
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupIntroStep()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  fileprivate func introStepViewController(withIdentifier identifier: String) -> UIViewController {
    
    return UIStoryboard.mainStoryboard().instantiateViewController(withIdentifier: identifier)
  }
  
  fileprivate func setupIntroStep() {
    
    dataSource = self
    
    setViewControllers([introStepViewControllers.first!], direction: .forward, animated: true, completion: nil)
  }
  
}

// MARK: - UIPageViewControllerDataSource

extension IntroPageViewController: UIPageViewControllerDataSource {
  
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    return introStepViewControllers.count
  }
  
  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    guard let firstViewController = viewControllers?.first,
          let firstViewControllerIndex = introStepViewControllers.index(of: firstViewController) else {
      return 0
    }
    
    return firstViewControllerIndex
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    
    guard let viewControllerIndex = introStepViewControllers.index(of: viewController) else {
      return nil
    }
    
    let previousIndex = viewControllerIndex - 1
    
    guard previousIndex >= 0  else {
      return nil
    }
    
    guard introStepViewControllers.count > previousIndex else {
      return nil
    }
    
    return introStepViewControllers[previousIndex]
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    
    guard let viewControllerIndex = introStepViewControllers.index(of: viewController) else {
      return nil
    }
    
    let nextIndex = viewControllerIndex + 1
    
    guard introStepViewControllers.count != nextIndex else {
      return nil
    }
    
    guard introStepViewControllers.count > nextIndex else {
      return nil
    }
    
    return introStepViewControllers[nextIndex]
  }
}
