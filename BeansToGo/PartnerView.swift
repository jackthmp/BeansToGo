//
//  PartnerView.swift
//  BeansToGo
//
//  Created by Jack Thompson on 7/25/19.
//  Copyright © 2019 Jack Thompson. All rights reserved.
//

import UIKit

class PartnerView: UIView {
  
  var imageView: UIImageView!
  var nameLabel: UILabel!
  var descriptionLabel: UILabel!
  var emailButton: UIButton!
  
  let imageHeight: CGFloat = 36
  let imageBorderWidth: CGFloat = 2
  let imagePadding: CGFloat = 12
  let edgePadding: CGFloat = 16
  let buttonPadding: CGFloat = 8
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    imageView = UIImageView(frame: .zero)
    imageView.backgroundColor = .red
    imageView.layer.cornerRadius = imageView.bounds.width/2
    imageView.clipsToBounds = true
    addSubview(imageView)
    
    nameLabel = UILabel(frame: .zero)
    nameLabel.font = UIFont._OpenSansRegular14
    nameLabel.textColor = ._primaryGray
    addSubview(nameLabel)
    
    descriptionLabel = UILabel(frame: .zero)
    descriptionLabel.font = UIFont._OpenSansRegular12
    descriptionLabel.textColor = ._secondaryGray
    descriptionLabel.numberOfLines = 0
    addSubview(descriptionLabel)
    
    emailButton = UIButton(frame: .zero)
    emailButton.setImage(#imageLiteral(resourceName: "18x18_external_link"), for: .normal)
    addSubview(emailButton)
    
    nameLabel.text = "Matthew P."
    descriptionLabel.text = "Engineering - Biz Money - Biz Money • Engineering Intern"
    
    setConstraints()
    
  }
  
  func setConstraints() {
    imageView.snp.makeConstraints { (make) in
      make.height.width.equalTo(imageHeight)
      make.top.leading.equalToSuperview().offset(edgePadding)
    }
    
    imageView.layer.cornerRadius = imageHeight / 2
    
    nameLabel.snp.makeConstraints { make in
      make.top.equalTo(imageView)
      make.leading.equalTo(imageView.snp.trailing).offset(imagePadding)
    }
    
    descriptionLabel.snp.makeConstraints { make in
      make.top.equalTo(nameLabel.snp.bottom)
      make.leading.equalTo(nameLabel)
      make.trailing.equalToSuperview().inset(edgePadding)
      make.bottom.equalToSuperview().inset(edgePadding)
    }
    
    emailButton.snp.makeConstraints { make in
      make.top.bottom.equalTo(nameLabel)
      make.leading.equalTo(nameLabel.snp.trailing).offset(buttonPadding)
      make.trailing.lessThanOrEqualToSuperview().inset(imagePadding)
    }
  
  
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
