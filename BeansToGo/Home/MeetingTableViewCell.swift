//
//  MeetingTableViewCell.swift
//  BeansToGo
//
//  Created by Jack Thompson on 7/24/19.
//  Copyright © 2019 Jack Thompson. All rights reserved.
//

import UIKit

class MeetingCellModel: NSObject {
  var meeting: Meeting!
  
  public init(meeting: Meeting) {
    self.meeting = meeting
  }
  
  public var meetingTitle: String {
    return meeting.subscription.title
  }
  
  public var meetingDetails: String {
    return "\(meeting.dateTime) • \(meeting.subscription.office)"
  }
  
  public var partnerViewModel: PartnerViewModel? {
    if meeting.participants.count > 1 {
      return PartnerViewModel(partner: meeting.participants[1])
    }
    
    return nil
  }
  
  public var isBooked: Bool {
    return !meeting.participants.isEmpty
  }
}

class MeetingTableViewCell: UITableViewCell, AvailableViewDelegate {
  
  var shadowContainerView: UIView = {
    let shadowContainerView = UIView()
    shadowContainerView.backgroundColor = .white
    shadowContainerView.layer.cornerRadius = 6
    shadowContainerView.layer.applySketchShadow(color: .black, alpha: 0.1, x: 0, y: 3, blur: 6)
    shadowContainerView.layer.masksToBounds = false
    return shadowContainerView
  }()
  
  var containerView: UIView = {
    let containerView = UIView()
    containerView.backgroundColor = .white
    containerView.layer.cornerRadius = 6
    containerView.clipsToBounds = true
    containerView.layer.borderColor = UIColor._lightGray.cgColor
    containerView.layer.borderWidth = 1
    return containerView
  }()
  
  var sideView: UIView = {
    let sideView = UIView()
    sideView.backgroundColor = ._lightRed
    return sideView
  }()
  
  var meetingTitleLabel: UILabel = {
    let meetingTitleLabel = UILabel()
    meetingTitleLabel.font = ._OpenSansBold16
    meetingTitleLabel.textColor = ._primaryGray
    return meetingTitleLabel
  }()
  
  var meetingDetailsLabel: UILabel = {
    let meetingDetailsLabel = UILabel()
    meetingDetailsLabel.font = ._OpenSansRegular14
    meetingDetailsLabel.textColor = ._secondaryGray
    return meetingDetailsLabel
  }()
  
  var dividerView: UIView = {
    let dividerView = UIView()
    dividerView.backgroundColor = ._lightGray
    return dividerView
  }()
  
  var partnerView: PartnerView = PartnerView()
  var availableView: AvailableView = AvailableView()
  
  let titleTextSize: CGFloat = 16
  let detailsTextSize: CGFloat = 14
  let dividerHeight: CGFloat = 1
  let sideViewWidth: CGFloat = 8
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = .white
    
    contentView.addSubview(shadowContainerView)
    contentView.addSubview(containerView)
    
    containerView.addSubview(sideView)
    containerView.addSubview(meetingTitleLabel)
    containerView.addSubview(meetingDetailsLabel)
    containerView.addSubview(dividerView)
    containerView.addSubview(partnerView)
    containerView.addSubview(availableView)
    
    partnerView.isHidden = true
    availableView.isHidden = false
    availableView.delegate = self
    
    setConstraints()
  }
  
  func setConstraints() {
    containerView.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.bottom.leading.trailing.equalToSuperview().inset(Padding.large)
    }
    
    shadowContainerView.snp.makeConstraints { make in
      make.edges.equalTo(containerView)
    }
    
    sideView.snp.makeConstraints { make in
      make.top.bottom.leading.equalToSuperview()
      make.width.equalTo(sideViewWidth)
    }
    
    meetingTitleLabel.snp.makeConstraints { make in
      make.top.trailing.equalToSuperview().inset(Padding.large)
      make.leading.equalTo(sideView.snp.trailing).offset(Padding.large)
    }
    
    meetingDetailsLabel.snp.makeConstraints { make in
      make.top.equalTo(meetingTitleLabel.snp.bottom).offset(Padding.extraSmall)
      make.leading.trailing.equalTo(meetingTitleLabel)
    }
    
    dividerView.snp.makeConstraints { make in
      make.top.equalTo(meetingDetailsLabel.snp.bottom).offset(Padding.large)
      make.leading.equalTo(sideView.snp.trailing).offset(Padding.large)
      make.trailing.equalToSuperview().inset(Padding.large)
      make.height.equalTo(dividerHeight)
    }
    
    partnerView.snp.makeConstraints { make in
      make.top.equalTo(dividerView.snp.bottom)
      make.leading.equalTo(sideView.snp.trailing)
      make.trailing.equalToSuperview()
      make.bottom.equalToSuperview()
    }
    
    availableView.snp.makeConstraints { make in
      make.top.equalTo(dividerView.snp.bottom)
      make.leading.equalTo(sideView.snp.trailing)
      make.trailing.equalToSuperview()
      make.bottom.equalToSuperview()
    }
  }
  
  func configure(with viewModel: MeetingCellModel) {
    meetingTitleLabel.text = viewModel.meetingTitle
    meetingDetailsLabel.text = viewModel.meetingDetails
    if let partnerViewModel = viewModel.partnerViewModel {
      partnerView.configure(with: partnerViewModel)
      sideView.backgroundColor = ._lightRed
      partnerView.isHidden = false
      availableView.isHidden = true
    } else {
      availableView.configure(isBooked: viewModel.isBooked)
      sideView.backgroundColor = viewModel.isBooked ? ._mediumBlue : ._lightGray
      partnerView.isHidden = true
      availableView.isHidden = false
    }
    setConstraints()
  }
  
  func didToggleAvailability(isBooked: Bool) {
    sideView.backgroundColor = isBooked ? ._mediumBlue : ._lightGray
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    return
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
