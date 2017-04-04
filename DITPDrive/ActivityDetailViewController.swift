//
//  ActivityDetailViewController.swift
//  DITPDrive
//
//  Created by Katchapon Poolpipat on 4/3/2560 BE.
//  Copyright © 2560 Katchapon Poolpipat. All rights reserved.
//

import UIKit

class ActivityDetailViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  private let kTableHeaderHeight: CGFloat = 345
  var headerView: UIView!
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 300
    headerView = tableView.tableHeaderView
    tableView.tableHeaderView = nil
    tableView.addSubview(headerView)
    tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
    tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
    
    updateHeaderView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
  }
  
  class func controller() -> ActivityDetailViewController {
    return UIStoryboard.activityDetailStoryboard().instantiateViewController(withIdentifier: "ActivityDetailViewController") as! ActivityDetailViewController
  }
  
  func updateHeaderView() {
    var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
    if tableView.contentOffset.y < -kTableHeaderHeight {
      headerRect.origin.y = tableView.contentOffset.y
      headerRect.size.height = -tableView.contentOffset.y
    }
    
    headerView.frame = headerRect
  }
  
  @IBAction func backTapped(_ sender: Any) {
    navigationController?.popViewController(animated: true)
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

extension ActivityDetailViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func cellIdentifier(at indexPath: IndexPath) -> String {
    switch indexPath.row {
    case 0: return ActivityDetailTableViewCell.identifier()
    case 1: return ActivityMapTableViewCell.identifier()
    case 2: return ActivityDescriptionTableViewCell.identifier()
    default:
      return ""
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let identifier = cellIdentifier(at: indexPath)
    let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
    
    return cell
  }
}

extension ActivityDetailViewController: UITableViewDelegate {
  
}

extension ActivityDetailViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    updateHeaderView()
  }
}
