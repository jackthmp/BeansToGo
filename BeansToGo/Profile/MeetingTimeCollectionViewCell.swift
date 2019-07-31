//
//  MeetingTimeCollectionViewCell.swift
//  BeansToGo
//
//  Created by Jack Thompson on 7/25/19.
//  Copyright © 2019 Jack Thompson. All rights reserved.
//

import UIKit

class MeetingTimeCellModel: NSObject {
  let meeting: MeetingSubscription!
  var isPreference: Bool!
  
  init(meeting: MeetingSubscription, isPreference: Bool) {
    self.meeting = meeting
    self.isPreference = isPreference
  }
  
  var time: String {
    return meeting.dateTime
  }
}

class MeetingTimeCollectionViewCell: UICollectionViewCell {
  
  var containerView: UIView = {
    let containerView = UIView()
    containerView.layer.borderColor = UIColor._secondaryGray.cgColor
    containerView.layer.borderWidth = 1
    containerView.layer.cornerRadius = Padding.large
    return containerView
  }()
  
  var timeLabel: UILabel = {
    let timeLabel = UILabel()
    timeLabel.font = ._OpenSansSemiBold13
    timeLabel.textColor = ._primaryGray
    return timeLabel
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(containerView)
    containerView.addSubview(timeLabel)
    
    setConstraints()
  }
  
  func setConstraints() {
    containerView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    timeLabel.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview().inset(Padding.large)
      make.top.bottom.equalToSuperview().inset(Padding.small)
    }
  }
  
  func setSelected(_ selected: Bool) {
    if selected {
      containerView.backgroundColor = ._lightBlue
      containerView.layer.borderColor = UIColor._regularBlue.cgColor
      timeLabel.textColor = ._regularBlue
    } else {
      containerView.backgroundColor = .white
      containerView.layer.borderColor = UIColor._lightGray.cgColor
      timeLabel.textColor = ._primaryGray
    }
  }
  
  func configure(with viewModel: MeetingTimeCellModel) {
    timeLabel.text = viewModel.time
    setSelected(viewModel.isPreference)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
