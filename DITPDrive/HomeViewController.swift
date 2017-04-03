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
  
  fileprivate let kCollectionHeaderHeight: CGFloat = 338.0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupCollectionViewContentOffset()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
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
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    switch kind {
    case UICollectionElementKindSectionHeader:
      let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionTitleCollectionReusableView.identifier(), for: indexPath) as! SectionTitleCollectionReusableView
      switch indexPath.section {
      case 0: headerView.titleLabel.text = "งานแสดงสินค้าที่กำลังจัดแสดง"
      case 1: headerView.titleLabel.text = "งานแสดงสินค้านานาชาติภายในประเทศ"
      case 2: headerView.titleLabel.text = "งานแสดงสินค้าในต่างประเทศ"
      default: headerView.titleLabel.text = ""
      }
      
      return headerView
    default:
      assert(false, "Unexpected element kind")
      return collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionTitleCollectionReusableView.identifier(), for: indexPath)
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
