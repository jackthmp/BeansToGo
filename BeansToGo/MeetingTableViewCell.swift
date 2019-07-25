//
//  MeetingTableViewCell.swift
//  BeansToGo
//
//  Created by Jack Thompson on 7/24/19.
//  Copyright © 2019 Jack Thompson. All rights reserved.
//

import UIKit

class MeetingTableViewCell: UITableViewCell {
  
  var containerView: UIView!
  var sideView: UIView!
  var meetingTitleLabel: UILabel!
  var meetingDetailsLabel: UILabel!
  var dividerView: UIView!
  var partnerView: UIView!
  
  let titleTextSize: CGFloat = 16
  let detailsTextSize: CGFloat = 14
  let padding: CGFloat = 16
  let titlePadding: CGFloat = 4
  let shadowOffset: CGFloat = 3
  let dividerHeight: CGFloat = 1
  let sideViewWidth: CGFloat = 8
  
  let containerPadding: CGFloat = 16
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = .white
    
    containerView = UIView(frame: .zero)
    containerView.backgroundColor = .white
    containerView.layer.applySketchShadow(color: .black, alpha: 0.1, x: 0, y: 3, blur: 6)
    containerView.layer.cornerRadius = 6
    containerView.layer.masksToBounds = false
//    containerView.clipsToBounds = true
    containerView.layer.borderColor = UIColor._lightGray.cgColor
    containerView.layer.borderWidth = 1
    contentView.addSubview(containerView)
    
    sideView = UIView(frame: .zero)
    sideView.backgroundColor = ._lightRed
    containerView.addSubview(sideView)
    
    meetingTitleLabel = UILabel(frame: .zero)
    meetingTitleLabel.text = "Yelp Weekly"
    meetingTitleLabel.font = ._OpenSansBold16
    meetingTitleLabel.textColor = ._primaryGray
    containerView.addSubview(meetingTitleLabel)
    
    meetingDetailsLabel = UILabel(frame: .zero)
    meetingDetailsLabel.text = "Friday, 11AM • New Montgomery Office (8F)"
    meetingDetailsLabel.font = ._OpenSansRegular14
    meetingDetailsLabel.textColor = ._secondaryGray
    containerView.addSubview(meetingDetailsLabel)
    
    dividerView = UIView(frame: .zero)
    dividerView.backgroundColor = ._lightGray
    containerView.addSubview(dividerView)
    
    partnerView = PartnerView(frame: .zero)
    containerView.addSubview(partnerView)
    
    setConstraints()
  }
  
  func setConstraints() {
    
    containerView.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.bottom.leading.trailing.equalToSuperview().inset(containerPadding)
    }
    
    
    sideView.snp.makeConstraints { make in
      make.top.bottom.leading.equalToSuperview()
      make.width.equalTo(sideViewWidth)
    }
    
    meetingTitleLabel.snp.makeConstraints { make in
      make.top.trailing.equalToSuperview().inset(padding)
      make.leading.equalTo(sideView.snp.trailing).offset(padding)
    }
    
    meetingDetailsLabel.snp.makeConstraints { make in
      make.top.equalTo(meetingTitleLabel.snp.bottom).offset(titlePadding)
      make.leading.trailing.equalTo(meetingTitleLabel)
    }
    
    dividerView.snp.makeConstraints { make in
      make.top.equalTo(meetingDetailsLabel.snp.bottom).offset(padding)
      make.leading.equalTo(sideView.snp.trailing).offset(padding)
      make.trailing.equalToSuperview().inset(padding)
      make.height.equalTo(dividerHeight)
    }
    
    partnerView.snp.makeConstraints { make in
      make.top.equalTo(dividerView.snp.bottom)
      make.leading.equalTo(sideView.snp.trailing)
      make.trailing.equalToSuperview()
      make.bottom.equalToSuperview()
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
     return

      // Configure the view for the selected state
  }

}
