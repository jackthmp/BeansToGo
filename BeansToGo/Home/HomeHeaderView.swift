//
//  HomeHeaderView.swift
//  BeansToGo
//
//  Created by Jack Thompson on 7/25/19.
//  Copyright © 2019 Jack Thompson. All rights reserved.
//

import UIKit

class HomeHeaderView: UIView {
  
  weak var delegate: HomeDelegate?

  var backgroundImageView: UIImageView = {
    let backgroundImageView = UIImageView()
    backgroundImageView.contentMode = .scaleAspectFill
    backgroundImageView.image = #imageLiteral(resourceName: "coffee")
    return backgroundImageView
  }()
  
  var colorView: UIView = {
    let colorView = UIView()
    colorView.backgroundColor = ._regularRed
    colorView.alpha = 0
    return colorView
  }()
  
  var titleLabel: UILabel = {
    let titleLabel = UILabel()
    titleLabel.font = ._PoppinsBold28
    titleLabel.textColor = .white
    titleLabel.layer.applySketchShadow(color: .black, alpha: 0.1, x: 0, y: 3, blur: 6, spread: 1)
    titleLabel.text = "Your Beans"
    return titleLabel
  }()
  
  var profileIcon: UIButton = {
    let profileIcon = UIButton()
    profileIcon.setImage(#imageLiteral(resourceName: "profileImage"), for: .normal)
    profileIcon.layer.borderColor = UIColor.white.cgColor
    profileIcon.layer.applySketchShadow(color: .black, alpha: 0.1, x: 0, y: 3, blur: 6, spread: 1)
    profileIcon.clipsToBounds = true
    return profileIcon
  }()
  
  let topPadding: CGFloat = 53
  let iconHeight: CGFloat = 48
  let iconBorderWidth: CGFloat = 2
  
  static let headerHeight: CGFloat = 240 + Padding.statusBarHeight
  static let maxHeaderHeight: CGFloat = headerHeight + 100
  static let minHeaderHeight: CGFloat = 145
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(backgroundImageView)
    addSubview(colorView)
    addSubview(titleLabel)
    addSubview(profileIcon)
    
    profileIcon.addTarget(self, action: #selector(didTapProfileIcon), for: .touchUpInside)
    profileIcon.layer.borderWidth = iconBorderWidth
    profileIcon.layer.cornerRadius = iconHeight / 2
    
    setConstraints()
  }
  
  func setConstraints() {
    backgroundImageView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
    
    titleLabel.snp.makeConstraints { make in
      make.top.equalTo(safeAreaInsets.top).offset(topPadding)
      make.leading.equalToSuperview().offset(Padding.large)
      make.bottom.lessThanOrEqualToSuperview().inset(topPadding)
    }
    
    profileIcon.snp.makeConstraints { make in
      make.centerY.equalTo(titleLabel)
      make.trailing.equalToSuperview().inset(Padding.large)
      make.height.width.equalTo(iconHeight)
    }
    
    colorView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  func updateColorAlpha(offset: CGFloat) {
    let alphaOffset = (offset/200)
    self.colorView.alpha = min(alphaOffset, 0.6)
  }
  
  @objc func didTapProfileIcon() {
    delegate?.openProfile()
  }
  
  func configure(profileImage: UIImage) {
    profileIcon.setImage(profileImage, for: .normal)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
