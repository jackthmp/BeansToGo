//
//  ProfileViewController.swift

//  
//
//  Created by Jack Thompson on 7/25/19.
//

import UIKit

protocol SetPreferencesDelegate: NSObject {
  func setPreferences()
}

class ProfileViewController: UIViewController {
  
  var user: User! {
    didSet {
      let profileHeaderViewModel = ProfileHeaderViewModel(user: user)
      profileHeaderView.configure(with: profileHeaderViewModel)
    }
  }
  
  var preferenceTableView: UITableView = {
    let preferenceTableView = UITableView(frame: .zero, style: .grouped)
    preferenceTableView.backgroundColor = .clear
    preferenceTableView.separatorStyle = .none
    preferenceTableView.showsVerticalScrollIndicator = false
    preferenceTableView.contentInsetAdjustmentBehavior = .never
    preferenceTableView.contentInset = UIEdgeInsets(top: ProfileHeaderView.headerHeight-Padding.statusBarHeight, left: 0, bottom: -Padding.statusBarHeight, right: 0)
    return preferenceTableView
  }()
  
  var profileHeaderView: ProfileHeaderView = ProfileHeaderView()
  
  var preferenceButton: PreferencesButtonView = PreferencesButtonView()
  
  let cellReuseIdentifier = "preferenceCell"

  let preferenceButtonHeight: CGFloat = 104
  
  var preferenceCellModels: [PreferenceCellModel] = {
    var models: [PreferenceCellModel] = []
    var user = User.testUser
    let groups = Dictionary(grouping: MeetingSubscription.dummySubscriptions, by: { $0.title })
    for (_, meetings) in groups {
      models.append(PreferenceCellModel(meetings: meetings, userSubscriptions: user.subscriptionPreferences))
    }
    return models
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    modalPresentationStyle = .formSheet
    
    view.addSubview(profileHeaderView)
    view.addSubview(preferenceTableView)
    view.addSubview(preferenceButton)
    
    preferenceTableView.dataSource = self
    preferenceTableView.delegate = self
    preferenceTableView.register(PreferenceTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    
    preferenceButton.delegate = self
    
    user = User.testUser
    
    setConstraints()
  }
  
  func setConstraints() {
    preferenceTableView.snp.makeConstraints { make in
      make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
      make.bottom.equalTo(preferenceButton.snp.top)
    }
    
    profileHeaderView.snp.makeConstraints { make in
      make.top.leading.trailing.equalToSuperview()
    }
    
    preferenceButton.snp.makeConstraints { make in
      make.leading.trailing.bottom.equalToSuperview()
      make.height.equalTo(preferenceButtonHeight)
    }
  }

}

extension ProfileViewController: SetPreferencesDelegate {
  func setPreferences() {
    dismiss(animated: true, completion: nil)
  }
  
}

extension ProfileViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return preferenceCellModels.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? PreferenceTableViewCell else { return UITableViewCell() }
    cell.configure(with: preferenceCellModels[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    return PreferenceTableHeaderView()
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return UITableView.automaticDimension
  }
}

extension ProfileViewController: UITableViewDelegate {
  
}
