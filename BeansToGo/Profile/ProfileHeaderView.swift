//
//  ProfileHeaderView.swift
//  BeansToGo
//
//  Created by Zoe Allen on 7/25/19.
//  Copyright © 2019 Jack Thompson. All rights reserved.
//

import UIKit

class ProfileHeaderViewModel: NSObject {
  var user: User!
  
  init(user: User) {
    self.user = user
  }
  
  var name: String {
    return "\(user.firstName) \(user.lastName)"
  }
  
  var team: String? {
    return user.team
  }
  
  var role: String {
    return user.role
  }
  
  var photoURL: String {
    return user.photoURL
  }
}

class ProfileHeaderView: UIView {
  
  var backgroundView: UIImageView = UIImageView(image: #imageLiteral(resourceName: "profileheaderpic"))
  var pictureView: UIImageView = UIImageView()
  
  var nameLabel: UILabel = {
    let nameLabel = UILabel(frame: .zero)
    nameLabel.textColor = ._primaryGray
    nameLabel.font = ._OpenSansBold21
    return nameLabel
  }()
  
  var roleOneLabel: UILabel = {
    let roleOneLabel = UILabel(frame: .zero)
    roleOneLabel.textColor = ._secondaryGray
    roleOneLabel.font = ._OpenSansRegular14
    return roleOneLabel
  }()
  
  var roleTwoLabel: UILabel = {
    let roleTwoLabel = UILabel(frame: .zero)
    roleTwoLabel.textColor = ._secondaryGray
    roleTwoLabel.font = ._OpenSansRegular14
    return roleTwoLabel
  }()

  let profilePicHeight: CGFloat = 128
  let backgroundImageHeight: CGFloat = 152
  
  static let headerHeight: CGFloat = 356
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .white
    
    addSubview(backgroundView)
    addSubview(pictureView)
    addSubview(nameLabel)
    addSubview(roleOneLabel)
    addSubview(roleTwoLabel)
    
    pictureView.layer.cornerRadius = profilePicHeight / 2
    pictureView.clipsToBounds = true
    
    setConstraints()
  }
  
  func setConstraints() {
    backgroundView.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview()
      make.top.equalToSuperview().offset(Padding.statusBarHeight)
      make.height.equalTo(backgroundImageHeight)
    }
    
    pictureView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.centerY.equalTo(backgroundView.snp.bottom)
      make.width.height.equalTo(profilePicHeight)
    }
    
    nameLabel.snp.makeConstraints { make in
      make.top.equalTo(pictureView.snp.bottom).offset(Padding.large)
      make.centerX.equalToSuperview()
    }
    
    roleOneLabel.snp.makeConstraints { make in
      make.top.equalTo(nameLabel.snp.bottom).offset(Padding.small)
      make.centerX.equalToSuperview()
    }
    
    roleTwoLabel.snp.makeConstraints { make in
      make.top.equalTo(roleOneLabel.snp.bottom).offset(Padding.small)
      make.bottom.equalToSuperview().inset(Padding.large)
      make.centerX.equalToSuperview()
    }
  }
  
  func configure(with viewModel: ProfileHeaderViewModel) {
    nameLabel.text = viewModel.name
    roleOneLabel.text = viewModel.team
    roleTwoLabel.text = viewModel.role
    
    NetworkController.downloadImage(from: URL(string: viewModel.photoURL)!) { image in
      self.pictureView.image = image
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
