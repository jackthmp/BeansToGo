//
//  AvailableView.swift
//  BeansToGo
//
//  Created by Zoe Allen on 7/25/19.
//  Copyright © 2019 Jack Thompson. All rights reserved.
//

import UIKit

protocol AvailableViewDelegate: NSObject {
  func didToggleAvailability(isBooked: Bool)
}

class AvailableView: UIView {
  
  var availableLabel: UILabel = {
    let availableLabel = UILabel()
    availableLabel.font = ._OpenSansSemiBold14
    availableLabel.textColor = ._secondaryGray
    return availableLabel
  }()
  
  var getBeansButton: UIButton = {
    let getBeansButton = UIButton(frame: .zero)
    getBeansButton.backgroundColor = ._regularRed
    getBeansButton.setTitle("Get Beans!", for: .normal)
    getBeansButton.titleLabel!.font = ._OpenSansSemiBold14
    getBeansButton.layer.cornerRadius = 4
    return getBeansButton
  }()
  
  let titleTextSize: CGFloat = 16
  let detailsTextSize: CGFloat = 14
  let buttonWidth: CGFloat = 95
  
  var isBooked: Bool = false
  weak var delegate: AvailableViewDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    
    addSubview(availableLabel)
    addSubview(getBeansButton)
    
    getBeansButton.addTarget(self, action: #selector(didTapGetBeansButton), for: .touchUpInside)
    
    setConstraints()
  }
  
  @objc func didTapGetBeansButton() {
    isBooked.toggle()
    configure(isBooked: isBooked)
    delegate?.didToggleAvailability(isBooked: isBooked)
  }
  
  func configure(isBooked: Bool) {
    if isBooked {
      availableLabel.text = "Available then?"
      getBeansButton.backgroundColor = ._regularRed
      getBeansButton.layer.borderColor = UIColor.clear.cgColor
      getBeansButton.setTitleColor(.white, for: .normal)
      getBeansButton.setTitle("Get Beans!", for: .normal)
    } else {
      availableLabel.text = "Pending..."
      getBeansButton.backgroundColor = .white
      getBeansButton.layer.borderWidth = 1
      getBeansButton.layer.borderColor = UIColor._primaryGray.cgColor
      getBeansButton.setTitleColor(._primaryGray, for: .normal)
      getBeansButton.setTitle("Cancel", for: .normal)
    }
  }
  
  func setConstraints() {
    availableLabel.snp.makeConstraints { make in
      make.top.bottom.leading.equalToSuperview().inset(Padding.large)
      make.trailing.equalTo(getBeansButton.snp.leading).offset(Padding.large)
    }
    
    getBeansButton.snp.makeConstraints { make in
      make.top.bottom.equalTo(availableLabel)
      make.trailing.equalToSuperview().inset(Padding.large)
      make.width.equalTo(buttonWidth)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
