//
//  PreferenceTableViewCell.swift
//  BeansToGo
//
//  Created by Jack Thompson on 7/25/19.
//  Copyright © 2019 Jack Thompson. All rights reserved.
//

import UIKit

class PreferenceCellModel: NSObject {
  public let meetings: [MeetingSubscription]!
  let userSubscriptions: [MeetingSubscription]!
  
  init(meetings: [MeetingSubscription], userSubscriptions: [MeetingSubscription]) {
    self.meetings = meetings
    self.userSubscriptions = userSubscriptions
  }
  
  var meetingType: String {
    return meetings[0].title
  }
  
  var meetingLocation: String {
    return meetings[0].office
  }
  
  var meetingTimeCellModels: [MeetingTimeCellModel] {
    var meetingCellModels: [MeetingTimeCellModel] = []
    for meeting in meetings {
      meetingCellModels.append(MeetingTimeCellModel(meeting: meeting, isPreference: userSubscriptions.contains(where: { $0 == meeting })))
    }
    return meetingCellModels
  }
}

class PreferenceTableViewCell: UITableViewCell {
  
  var meetingTypeLabel: UILabel = {
    let meetingTypeLabel = UILabel()
    meetingTypeLabel.font = ._OpenSansBold16
    meetingTypeLabel.textColor = ._primaryGray
    return meetingTypeLabel
  }()
  
  var meetingLocationLabel: UILabel = {
    let meetingLocationLabel = UILabel()
    meetingLocationLabel.font = ._OpenSansRegular14
    meetingLocationLabel.textColor = ._secondaryGray
    return meetingLocationLabel
  }()
  
  var timeCollectionView: UICollectionView = {
    let timeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let layout = timeCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
    layout?.scrollDirection = .horizontal
    layout?.minimumInteritemSpacing = Padding.small
    layout?.estimatedItemSize = CGSize(width: 92, height: 32)
    
    timeCollectionView.backgroundColor = .clear
    timeCollectionView.alwaysBounceHorizontal = true
    timeCollectionView.showsHorizontalScrollIndicator = false
    timeCollectionView.allowsMultipleSelection = true
    return timeCollectionView
  }()
  
  var dividerView: UIView = {
    let dividerView = UIView()
    dividerView.backgroundColor = ._lightGray
    return dividerView
  }()
  
  let dividerHeight: CGFloat = 1
  let collectionViewHeight: CGFloat = 48
  let cellReuseIdentifier = "meetingTimeCell"
  
  var cellModels: [MeetingTimeCellModel] = []
  var userPreferences: [MeetingSubscription] = []
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    
    addSubview(meetingTypeLabel)
    addSubview(meetingLocationLabel)
    addSubview(timeCollectionView)
    addSubview(dividerView)
    
    timeCollectionView.dataSource = self
    timeCollectionView.delegate = self
    timeCollectionView.register(MeetingTimeCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
    
    setConstraints()
  }
  
  func setConstraints() {
    meetingTypeLabel.snp.makeConstraints { make in
      make.top.leading.trailing.equalToSuperview().inset(Padding.large)
    }
    meetingLocationLabel.snp.makeConstraints { make in
      make.top.equalTo(meetingTypeLabel.snp.bottom).offset(Padding.extraSmall)
      make.leading.equalTo(meetingTypeLabel)
      make.trailing.equalToSuperview().inset(Padding.large)
    }
    
    timeCollectionView.snp.makeConstraints { make in
      make.top.equalTo(meetingLocationLabel.snp.bottom).offset(Padding.extraSmall)
      make.bottom.equalToSuperview().inset(Padding.extraSmall)
      make.leading.trailing.equalToSuperview()
      make.height.equalTo(collectionViewHeight)
    }
    
    dividerView.snp.makeConstraints { make in
      make.bottom.equalToSuperview()
      make.leading.trailing.equalToSuperview().inset(Padding.large)
      make.height.equalTo(dividerHeight)
    }
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    return
  }
  
  func configure(with viewModel: PreferenceCellModel) {
    meetingTypeLabel.text = viewModel.meetingType
    meetingLocationLabel.text = viewModel.meetingLocation
    cellModels = viewModel.meetingTimeCellModels
    userPreferences = viewModel.userSubscriptions
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - UICollectionViewDataSource
extension PreferenceTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return cellModels.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as? MeetingTimeCollectionViewCell else { return UICollectionViewCell() }
    cell.configure(with: cellModels[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let cell = collectionView.cellForItem(at: indexPath) as? MeetingTimeCollectionViewCell else { return }
    cell.setSelected(true)
  }
  
  func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    guard let cell = collectionView.cellForItem(at: indexPath) as? MeetingTimeCollectionViewCell else { return }
    cell.setSelected(false)
  }
}

// MARK: - UICollectionViewDelegate
extension PreferenceTableViewCell: UICollectionViewDelegate { }

// MARK: - UICollectionViewDelegateFlowLayout
extension PreferenceTableViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: Padding.large, bottom: 0, right: Padding.large)
  }
}
