//
//  HomeViewController.swift
//  Beans To Go
//
//  Created by Jack Thompson on 7/24/19.
//  Copyright © 2019 Jack Thompson. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  //private var meetingTableView: UITableView!
    private var availableView: UIView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .red
    
//    meetingTableView = UITableView(frame: .zero)
//    meetingTableView.delegate = self
//    meetingTableView.dataSource = self
//    meetingTableView.register(MeetingTableViewCell.self, forCellReuseIdentifier: "meetingCell")
//    meetingTableView.separatorStyle = .none
//    view.addSubview(meetingTableView)
    availableView = AvailableView(frame: .zero)
    availableView.backgroundColor = .white
    view.addSubview(availableView)
    
    setConstraints()
  }
  
  func setConstraints() {
//    meetingTableView.snp.makeConstraints { make in
//      make.edges.equalToSuperview()
//    }
    availableView.translatesAutoresizingMaskIntoConstraints = false
    availableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
    availableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    availableView.heightAnchor.constraint(equalToConstant: 200).isActive = true
//    availableView.trailingAnchor.constraint(equalTo:
  }
}

extension HomeViewController: UITableViewDelegate {
  
}

extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = MeetingTableViewCell(style: .default, reuseIdentifier: "meetingCell")
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

