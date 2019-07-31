//
//  PreferencesButtonView.swift
//  BeansToGo
//
//  Created by Zoe Allen on 7/25/19.
//  Copyright © 2019 Jack Thompson. All rights reserved.
//

import UIKit

class PreferencesButtonView: UIView {

  weak var delegate: SetPreferencesDelegate?
  var buttonView: UIButton = {
    let buttonView = UIButton(frame: .zero)
    buttonView.setTitle("Set Preferences", for: .normal)
    buttonView.addTarget(self, action: #selector(didTapSetPreferences), for: .touchUpInside)
    buttonView.backgroundColor = ._regularRed
    buttonView.titleLabel!.font = ._OpenSansSemiBold16
    buttonView.layer.cornerRadius = Padding.extraSmall
    return buttonView
  }()
  
  var dividerView: UIView = {
    let dividerView = UIView()
    dividerView.backgroundColor = ._lightGray
    return dividerView
  }()
  
  let dividerHeight = 1
  
  override init(frame: CGRect){
    super.init(frame: frame)
    
    backgroundColor = .white
    
    buttonView.addTarget(self, action: #selector(didTapSetPreferences), for: .touchUpInside)

    addSubview(buttonView)
    addSubview(dividerView)
    
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
    buttonView.snp.makeConstraints { make in
      make.top.bottom.equalToSuperview().inset(Padding.extraLarge)
      make.leading.trailing.equalToSuperview().inset(Padding.large)
    }
    
    dividerView.snp.makeConstraints { make in
      make.height.equalTo(dividerHeight)
      make.top.leading.trailing.equalToSuperview()
    }
  }
  
  @objc func didTapSetPreferences() {
    delegate?.setPreferences()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
