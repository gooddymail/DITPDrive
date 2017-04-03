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
  @IBOutlet weak var categoryCarousel: iCarousel!
  
  var categories: [String] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupHighlightActivityPageView()
    setupCategory()
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
  
  fileprivate func setupCategory() {
    categoryCarousel.type = .linear
    categoryCarousel.stopAtItemBoundary = true
    categoryCarousel.scrollToItemBoundary = true
    categoryCarousel.decelerationRate = 0.65
    categoryCarousel.scrollSpeed = 3
    categories = ["งานแสดงสินค้านานาชาติในประเทศ", "งานแสดงสินค้าในต่างประเทศ", "ฝึกอบรม"]
    categoryCarousel.reloadData()
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

extension HighlightAndCategoryViewController: iCarouselDataSource {
  func numberOfItems(in carousel: iCarousel) -> Int {
    return categories.count
  }
  
  func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
    let categoryView = CategoryView()
    categoryView.categoryImageView.image = UIImage(named: "categoryBG")
    categoryView.categoryNameLabel.text = categories[index]
    
    return categoryView
  }
}

extension HighlightAndCategoryViewController: iCarouselDelegate {
  func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
    switch option {
    case .wrap:
      return 1.0
    
    default:
      return value
    }
  }
}
