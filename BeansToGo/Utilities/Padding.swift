//
//  Padding.swift
//  BeansToGo
//
//  Created by Jack Thompson on 7/29/19.
//  Copyright © 2019 Jack Thompson. All rights reserved.
//

import UIKit

public struct Padding {
  public static let extraSmall: CGFloat = 4
  public static let small: CGFloat = extraSmall * 2 // 8
  public static let medium: CGFloat = extraSmall * 3 // 12
  public static let large: CGFloat = extraSmall * 4 // 16
  public static let extraLarge: CGFloat = extraSmall * 8 // 32
  
  public static let statusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.height
}
