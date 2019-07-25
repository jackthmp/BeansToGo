//
//  PreferencesButtonView.swift
//  BeansToGo
//
//  Created by Zoe Allen on 7/25/19.
//  Copyright © 2019 Jack Thompson. All rights reserved.
//

import UIKit

class PreferencesButtonView: UIView {

  var buttonView: UIButton!
  
  let padding: CGFloat = 16
  let paddingLarge: CGFloat = 24
  
  override init(frame: CGRect){
    super.init(frame: frame)
    
    buttonView = UIButton(frame: .zero)
    buttonView.setTitle("Set Preferences", for: .normal)
    buttonView.backgroundColor = ._regularRed
    buttonView.titleLabel!.font = ._OpenSansSemiBold16
    buttonView.layer.cornerRadius = 4
    addSubview(buttonView)
    
    setConstraints()
    configure(isUpdating: false)
  }
  
  func configure(isUpdating: Bool) {
    if isUpdating {
      buttonView.setTitle("Update Preferences", for: .normal)
    } else {
      buttonView.setTitle("Set Preferences", for: .normal)
    }
  }
  
  func setConstraints() {
    buttonView.translatesAutoresizingMaskIntoConstraints = false
    buttonView.topAnchor.constraint(equalTo: topAnchor, constant: paddingLarge).isActive = true
    buttonView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
    buttonView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding).isActive = true
    buttonView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -paddingLarge).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
