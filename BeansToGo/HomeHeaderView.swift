//
//  HomeHeaderView.swift
//  BeansToGo
//
//  Created by Jack Thompson on 7/25/19.
//  Copyright © 2019 Jack Thompson. All rights reserved.
//

import UIKit

class HomeHeaderView: UIView {

  var backgroundImageView: UIImageView!
  var titleLabel: UILabel!
  var profileIcon: UIButton!
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundImageView = UIImageView()
    backgroundImageView.backgroundColor = .gray
    addSubview(backgroundImageView)
    
    setConstraints()
  }
  
  func setConstraints() {
    backgroundImageView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
