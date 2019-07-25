//
//  ProfileHeaderView.swift
//  BeansToGo
//
//  Created by Zoe Allen on 7/25/19.
//  Copyright © 2019 Jack Thompson. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
  
  var backgroundView: UIImageView!
  var pictureView: UIImageView!
  
  var nameLabel: UILabel!
  var roleOneLabel: UILabel!
  var roleTwoLabel: UILabel!
  
  let padding: CGFloat = 16
  let profilePicStart = 114
  let nameStart: CGFloat = 258
  
  let profileBackground = #imageLiteral(resourceName: "profileheaderpic")
  let profilePicture = #imageLiteral(resourceName: "profilePicture")
  let yourName = "Zoe Allen"
  let roleOne = "Product Mgmt (Vivek Patel (Inherited))"
  let roleTwo = "Engineering Intern"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundView = UIImageView(image: profileBackground)
    backgroundView.frame = CGRect(x: 0, y: 30, width: UIScreen.main.bounds.width, height: 152)
    addSubview(backgroundView)
    
    pictureView = UIImageView(image: profilePicture)
    pictureView.frame = CGRect(x: Int(UIScreen.main.bounds.width/2-128/2), y: profilePicStart, width: 128, height: 128)
    addSubview(pictureView)
  
    nameLabel = UILabel(frame: .zero)
    nameLabel.text = yourName
    nameLabel.textColor = ._primaryGray
    nameLabel.font = ._OpenSansBold21
    addSubview(nameLabel)
    
    roleOneLabel = UILabel(frame: .zero)
    roleOneLabel.text = roleOne
    roleOneLabel.textColor = ._secondaryGray
    roleOneLabel.font = ._OpenSansRegular14
    addSubview(roleOneLabel)
    
    roleTwoLabel = UILabel(frame: .zero)
    roleTwoLabel.text = roleTwo
    roleTwoLabel.textColor = ._secondaryGray
    roleTwoLabel.font = ._OpenSansRegular14
    addSubview(roleTwoLabel)
    
    setConstraints()
  }
  
  func setConstraints() {
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: nameStart).isActive = true
    nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    
    roleOneLabel.snp.makeConstraints { make in
      make.top.equalTo(nameLabel.snp.bottom).offset(padding/2)
      roleOneLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    roleTwoLabel.snp.makeConstraints { make in
      make.top.equalTo(roleOneLabel.snp.bottom).offset(padding/2)
      roleTwoLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
