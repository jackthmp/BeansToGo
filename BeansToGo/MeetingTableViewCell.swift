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
  
  let titleTextSize: CGFloat = 16
  let detailsTextSize: CGFloat = 14
  let padding: CGFloat = 16
  let titlePadding: CGFloat = 4
  let shadowOffset: CGFloat = 3
  
  let containerPadding: CGFloat = 16
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = .white
    
    containerView = UIView(frame: .zero)
    containerView.backgroundColor = .white
    containerView.layer.applySketchShadow(color: .black, alpha: 0.1, x: 0, y: 3, blur: 6)
    containerView.layer.cornerRadius = 6
    containerView.layer.masksToBounds = false
    containerView.clipsToBounds = true
    containerView.layer.borderColor = UIColor.lightGray.cgColor
    containerView.layer.borderWidth = 1
    contentView.addSubview(containerView)
    
    sideView = UIView(frame: .zero)
    sideView.backgroundColor = .red
    containerView.addSubview(sideView)
    
    meetingTitleLabel = UILabel(frame: .zero)
    meetingTitleLabel.text = "Yelp Weekly"
    meetingTitleLabel.font = .OpenSansBold16
    containerView.addSubview(meetingTitleLabel)
    
    meetingDetailsLabel = UILabel(frame: .zero)
    meetingDetailsLabel.text = "Friday, 11AM • New Montgomery Office (8F)"
    meetingDetailsLabel.font = .OpenSansRegular14
    containerView.addSubview(meetingDetailsLabel)
    
    setConstraints()
  }
  
  func setConstraints() {
    containerView.translatesAutoresizingMaskIntoConstraints = false
    containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: containerPadding/2).isActive = true
    containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -containerPadding/2).isActive = true
    containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: containerPadding).isActive = true
    containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -containerPadding).isActive = true
    
    sideView.translatesAutoresizingMaskIntoConstraints = false
    sideView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
    sideView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    sideView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
    sideView.widthAnchor.constraint(equalToConstant: 8).isActive = true
    
    meetingTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    meetingTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding).isActive = true
    meetingTitleLabel.leadingAnchor.constraint(equalTo: sideView.trailingAnchor, constant: padding).isActive = true
    
    meetingDetailsLabel.translatesAutoresizingMaskIntoConstraints = false
    meetingDetailsLabel.topAnchor.constraint(equalTo: meetingTitleLabel.bottomAnchor, constant: titlePadding).isActive = true
    meetingDetailsLabel.leadingAnchor.constraint(equalTo: meetingTitleLabel.leadingAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
     return

      // Configure the view for the selected state
  }

}
