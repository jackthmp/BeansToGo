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
  
  let imageHeight: CGFloat = 36
  let imagePadding: CGFloat = 12
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    imageView = UIImageView(frame: .zero)
    imageView.backgroundColor = .red
    imageView.layer.cornerRadius = imageView.bounds.width/2
    addSubview(imageView)
    
    nameLabel = UILabel(frame: .zero)
    nameLabel.font = UIFont._OpenSansRegular14
    nameLabel.textColor = ._primaryGray
    addSubview(nameLabel)
    
    descriptionLabel = UILabel(frame: .zero)
    descriptionLabel.font = UIFont._OpenSansRegular12
    descriptionLabel.textColor = ._secondaryGray
    addSubview(descriptionLabel)
    
    setConstraints()
    
  }
  
  func setConstraints() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.heightAnchor.constraint(equalToConstant: imageHeight).isActive = true
    imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor).isActive = true
    imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    nameLabel.topAnchor.constraint(equalTo: imageView.topAnchor).isActive = true
    nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: imagePadding)
    nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -imagePadding)
    
    descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    descriptionLabel.topAnchor.co
  
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
