//
//  AvailableView.swift
//  BeansToGo
//
//  Created by Zoe Allen on 7/25/19.
//  Copyright © 2019 Jack Thompson. All rights reserved.
//

import UIKit

class AvailableView: UIView {
  
  var availableQuestion: UILabel!
  var getBeansButton: UIButton!
  
  let padding: CGFloat = 16
  let titleTextSize: CGFloat = 16
  let detailsTextSize: CGFloat = 14
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    
    availableQuestion = UILabel(frame: .zero)
    
    availableQuestion.font = ._OpenSansSemiBold14
    availableQuestion.textColor = ._secondaryGray
    addSubview(availableQuestion)
    
    getBeansButton = UIButton(frame: .zero)
    getBeansButton.backgroundColor = ._regularRed
    getBeansButton.setTitle("Get Beans!", for: .normal)
    getBeansButton.titleLabel!.font = ._OpenSansSemiBold14
    getBeansButton.layer.cornerRadius = 4
    addSubview(getBeansButton)
    
    setConstraints()
    configure(isBooked: true)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(isBooked: Bool) {
    if isBooked {
      availableQuestion.text = "Available then?"
      getBeansButton.backgroundColor = ._regularRed
      getBeansButton.setTitleColor(.white, for: .normal)
      getBeansButton.setTitle("Get Beans!", for: .normal)
      
    } else {
      availableQuestion.text = "Pending..."
      getBeansButton.backgroundColor = .white
      getBeansButton.layer.borderWidth = 1
      getBeansButton.layer.borderColor = UIColor._primaryGray.cgColor
      getBeansButton.setTitleColor(._primaryGray, for: .normal)
      getBeansButton.setTitle("Cancel", for: .normal)
    }
  }
  
  func setConstraints() {
    availableQuestion.translatesAutoresizingMaskIntoConstraints = false
    availableQuestion.topAnchor.constraint(equalTo: topAnchor, constant: padding).isActive = true
    availableQuestion.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding).isActive = true
    availableQuestion.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding).isActive = true
    availableQuestion.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    
    getBeansButton.translatesAutoresizingMaskIntoConstraints = false
    getBeansButton.topAnchor.constraint(equalTo: topAnchor, constant: padding).isActive = true
    getBeansButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding).isActive = true
    getBeansButton.widthAnchor.constraint(equalToConstant: 95).isActive = true
    getBeansButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding).isActive = true
    
  }
  
}
