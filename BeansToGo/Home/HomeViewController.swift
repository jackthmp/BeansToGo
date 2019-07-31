//
//  HomeViewController.swift
//  Beans To Go
//
//  Created by Jack Thompson on 7/24/19.
//  Copyright © 2019 Jack Thompson. All rights reserved.
//

import UIKit

protocol HomeDelegate: NSObject {
  func openProfile()
}

class HomeViewController: UIViewController, HomeDelegate, PartnerDelegate {
  
  private var meetingTableView: UITableView = {
    let meetingTableView = UITableView(frame: .zero, style: .grouped)
    meetingTableView.backgroundColor = .white
    meetingTableView.separatorStyle = .none
    meetingTableView.showsVerticalScrollIndicator = false
    meetingTableView.contentInset = UIEdgeInsets(top: HomeHeaderView.headerHeight, left: 0, bottom: 0, right: 0)
    return meetingTableView
  }()
  
  private var homeHeaderView: HomeHeaderView = {
    let homeHeaderView = HomeHeaderView()
    homeHeaderView.clipsToBounds = true
    return homeHeaderView
  }()
  
  var headerHeightConstraint: NSLayoutConstraint!
  let reuseIdentifier = "meetingCell"
  
  let dummyMeetings = Meeting.dummyMeetings
  
  override var preferredStatusBarStyle : UIStatusBarStyle {
    return .lightContent
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .red
    setNeedsStatusBarAppearanceUpdate()
    
    meetingTableView.delegate = self
    meetingTableView.dataSource = self
    meetingTableView.register(MeetingTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
    meetingTableView.contentInsetAdjustmentBehavior = .never
    view.addSubview(meetingTableView)
   
    homeHeaderView.delegate = self
    view.addSubview(homeHeaderView)
    
    let user = User.testUser
    if let url = URL(string: user.photoURL) {
      NetworkController.downloadImage(from: url) { (image) in
        guard let image = image else { return }
        self.homeHeaderView.configure(profileImage: image)
      }
    }
    
    setConstraints()
  }
  
  func setConstraints() {
    homeHeaderView.translatesAutoresizingMaskIntoConstraints = false
    headerHeightConstraint = homeHeaderView.heightAnchor.constraint(equalToConstant: HomeHeaderView.headerHeight)
    headerHeightConstraint.isActive = true
    
    homeHeaderView.snp.makeConstraints { make in
      make.top.leading.trailing.equalToSuperview()
    }
    
    meetingTableView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  func openProfile() {
    let profileViewController = ProfileViewController()
    navigationController?.present(profileViewController, animated: true, completion: nil)
  }
  
  func animateHeader() {
    self.headerHeightConstraint.constant = HomeHeaderView.headerHeight
    UIView.animate(withDuration: 0.4, animations: {
      self.view.layoutIfNeeded()
    })
  }
  
  func emailPartner(email: String) {
    if let url = URL(string: "mailto:\(email)") {
      UIApplication.shared.open(url)
    }
  }
}

// MARK - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
  
}

// MARK - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dummyMeetings.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? MeetingTableViewCell else { return UITableViewCell() }
    cell.configure(with: MeetingCellModel(meeting: dummyMeetings[indexPath.row]))
    cell.partnerView.delegate = self
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = MeetingTableHeaderView()
    return headerView
  }
}

// MARK - UIScrollViewDelegate
extension HomeViewController: UIScrollViewDelegate {
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    print(scrollView.contentOffset.y)
    
    let y = HomeHeaderView.headerHeight - (scrollView.contentOffset.y + HomeHeaderView.headerHeight)
    
    let height = min(max(y, HomeHeaderView.minHeaderHeight), HomeHeaderView.maxHeaderHeight)
    
    self.headerHeightConstraint.constant = height
    
    homeHeaderView.updateColorAlpha(offset: scrollView.contentOffset.y + HomeHeaderView.headerHeight)
  }
}

