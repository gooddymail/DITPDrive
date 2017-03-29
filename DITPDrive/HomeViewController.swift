//
//  HomeViewController.swift
//  DITPDrive
//
//  Created by Katchapon Poolpipat on 3/9/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var hightlightActivityContainerView: UIView!
  @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var headerViewTopConstraint: NSLayoutConstraint!
  
  fileprivate let kCollectionHeaderHeight: CGFloat = 160
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupCollectionViewContentOffset()
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
    highlightActivityPageViewController.view.frame = CGRect(x: 0, y: 0, width: hightlightActivityContainerView.frame.size.width, height: hightlightActivityContainerView.frame.size.height)
    hightlightActivityContainerView.addSubview(highlightActivityPageViewController.view)
    highlightActivityPageViewController.didMove(toParentViewController: self)
  }
  
  fileprivate func highlightActivityViewController() -> UIViewController {
    return storyboard!.instantiateViewController(withIdentifier: "HighlightActivity")
  }
  
  fileprivate func updateHeaderView() {
    var headerReact = CGRect(x: 0, y: 0, width: hightlightActivityContainerView.frame.size.width, height: kCollectionHeaderHeight)
    headerReact.origin.y = -collectionView.contentOffset.y
    headerReact.size.height = -collectionView.contentOffset.y
    headerViewHeightConstraint.constant = headerReact.size.height
  }
  
  fileprivate func setupCollectionViewContentOffset() {
    collectionView.contentInset = UIEdgeInsets(top: kCollectionHeaderHeight, left: 0, bottom: 0, right: 0)
    collectionView.contentOffset = CGPoint(x: 0, y: -kCollectionHeaderHeight)
    updateHeaderView()
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

extension HomeViewController: UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    switch kind {
    case UICollectionElementKindSectionHeader:
      let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionTitleCollectionReusableView.identifier(), for: indexPath)
      return headerView
    default:
      assert(false, "Unexpected element kind")
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeActivityCollectionViewCell.identifier(), for: indexPath)
    return cell
  }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 15, bottom: 5, right: 15)
  }
}

extension HomeViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    updateHeaderView()
  }
}
