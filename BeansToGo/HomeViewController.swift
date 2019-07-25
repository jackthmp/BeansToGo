//
//  HomeViewController.swift
//  Beans To Go
//
//  Created by Jack Thompson on 7/24/19.
//  Copyright © 2019 Jack Thompson. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  private var meetingTableView: UITableView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .red
    
    meetingTableView = UITableView(frame: .zero)
    meetingTableView.delegate = self
    meetingTableView.dataSource = self
    meetingTableView.register(MeetingTableViewCell.self, forCellReuseIdentifier: "meetingCell")
    meetingTableView.separatorStyle = .none
    view.addSubview(meetingTableView)
    
    setConstraints()
  }
  
  func setConstraints() {
    meetingTableView.translatesAutoresizingMaskIntoConstraints = false
    meetingTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    meetingTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    meetingTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    meetingTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
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
    return 146
  }
  
  
}

