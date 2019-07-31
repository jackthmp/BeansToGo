//
//  MeetingTableHeaderView.swift
//  BeansToGo
//
//  Created by Jack Thompson on 7/25/19.
//  Copyright © 2019 Jack Thompson. All rights reserved.
//

import UIKit

class MeetingTableHeaderView: UIView {
  
  var label: UILabel = {
    let label = UILabel()
    label.font = ._OpenSansSemiBold16
    label.textColor = ._secondaryGray
    label.text = "This Week"
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .white
    
    addSubview(label)
    
    setConstraints()
  }
  
  func setConstraints() {
    label.snp.makeConstraints { make in
      make.top.bottom.leading.equalToSuperview().inset(Padding.large)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
