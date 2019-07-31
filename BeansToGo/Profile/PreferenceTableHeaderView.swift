//
//  PreferenceTableHeaderView.swift
//  BeansToGo
//
//  Created by Jack Thompson on 7/25/19.
//  Copyright © 2019 Jack Thompson. All rights reserved.
//

import UIKit

class PreferenceTableHeaderView: UIView {

  var label: UILabel = {
    var label = UILabel()
    label.font = ._OpenSansBold18
    label.textColor = ._primaryGray
    label.text = "When are you free for beans?"
    return label
  }()
  
  var topDividerView: UIView = {
    let view = UIView()
    view.backgroundColor = ._lightGray
    return view
  }()
  
  var bottomDividerView: UIView = {
    let view = UIView()
    view.backgroundColor = ._lightGray
    return view
  }()
  
  let dividerHeight: CGFloat = 1
  let topDividerHeight: CGFloat = 8
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    
    addSubview(topDividerView)
    addSubview(label)
    addSubview(bottomDividerView)
    
    setConstraints()
  }
  
  func setConstraints() {
    topDividerView.snp.makeConstraints { make in
      make.top.leading.trailing.equalToSuperview()
      make.height.equalTo(topDividerHeight)
    }
    
    label.snp.makeConstraints { make in
      make.top.equalTo(topDividerView.snp.bottom).offset(Padding.large)
      make.leading.trailing.bottom.equalToSuperview().inset(Padding.large)
    }
    
    bottomDividerView.snp.makeConstraints { make in
      make.leading.trailing.bottom.equalToSuperview()
      make.height.equalTo(dividerHeight)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
