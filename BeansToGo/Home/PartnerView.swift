//
//  PartnerView.swift
//  BeansToGo
//
//  Created by Jack Thompson on 7/25/19.
//  Copyright © 2019 Jack Thompson. All rights reserved.
//

import UIKit

protocol PartnerDelegate: NSObject {
  func emailPartner(email: String)
}

class PartnerViewModel: NSObject {
  var partner: User!
  
  public init(partner: User) {
    self.partner = partner
  }
  
  public var photoURL: String {
    return partner.photoURL
  }
  
  public var name: String {
    return "\(partner.firstName) \(partner.lastName)"
  }
  
  public var details: String {
    var string = ""
    if let team = partner.team {
      string += "\(team) • "
    }
    return string + partner.role
  }
  
  public var email: String {
    return partner.email
  }
}

class PartnerView: UIView {
  
  var imageView: UIImageView = {
    let imageView = UIImageView(frame: .zero)
    imageView.layer.cornerRadius = imageView.bounds.width/2
    imageView.clipsToBounds = true
    return imageView
  }()
  
  var nameLabel: UILabel = {
    let  nameLabel = UILabel(frame: .zero)
    nameLabel.font = UIFont._OpenSansRegular14
    nameLabel.textColor = ._primaryGray
    return nameLabel
  }()
  
  var descriptionLabel: UILabel = {
    let descriptionLabel = UILabel()
    descriptionLabel.font = UIFont._OpenSansRegular12
    descriptionLabel.textColor = ._secondaryGray
    descriptionLabel.numberOfLines = 1
    return descriptionLabel
  }()
  
  var emailButton: UIButton = {
    let emailButton = UIButton(frame: .zero)
    emailButton.setImage(#imageLiteral(resourceName: "18x18_external_link"), for: .normal)
    return emailButton
  }()
  
  let imageHeight: CGFloat = 36
  let imageBorderWidth: CGFloat = 2
  
  var emailAddress: String = ""
  weak var delegate: PartnerDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(imageView)
    addSubview(nameLabel)
    addSubview(descriptionLabel)
    addSubview(emailButton)
    
    emailButton.addTarget(self, action: #selector(didTapEmailButton), for: .touchUpInside)
    
    setConstraints()
  }
  
  @objc func didTapEmailButton() {
    delegate?.emailPartner(email: emailAddress)
  }
  
  func setConstraints() {
    imageView.snp.makeConstraints { (make) in
      make.height.width.equalTo(imageHeight)
      make.top.leading.equalToSuperview().offset(Padding.large)
    }
    
    imageView.layer.cornerRadius = imageHeight / 2
    
    nameLabel.snp.makeConstraints { make in
      make.top.equalTo(imageView)
      make.leading.equalTo(imageView.snp.trailing).offset(Padding.medium)
    }
    
    descriptionLabel.snp.makeConstraints { make in
      make.top.equalTo(nameLabel.snp.bottom)
      make.leading.equalTo(nameLabel)
      make.trailing.equalToSuperview().inset(Padding.large)
      make.bottom.equalToSuperview().inset(Padding.large)
    }
    
    emailButton.snp.makeConstraints { make in
      make.top.bottom.equalTo(nameLabel)
      make.leading.equalTo(nameLabel.snp.trailing).offset(Padding.small)
      make.trailing.lessThanOrEqualToSuperview().inset(Padding.medium)
    }
  }
  
  func configure(with viewModel: PartnerViewModel) {
    NetworkController.downloadImage(from: URL(string: viewModel.photoURL)!) { image in
      self.imageView.image = image
    }
    
    nameLabel.text = viewModel.name
    descriptionLabel.text = viewModel.details
    emailAddress = viewModel.email
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
