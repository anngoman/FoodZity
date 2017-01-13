//
//  ViewExtension.swift
//  FoodZity
//
//  Created by Anna Goman on 11.01.17.
//  Copyright © 2017 Anna Goman. All rights reserved.
//

import UIKit

extension UIView {
  @IBInspectable var cornerRadius: CGFloat {
    get {
      return layer.cornerRadius
    }
    set {
      layer.cornerRadius = newValue
      layer.masksToBounds = newValue > 0
    }
  }
  
  @IBInspectable var borderWidth: CGFloat {
    get {
      return layer.borderWidth
    }
    set {
      layer.borderWidth = newValue
      layer.masksToBounds = newValue > 0
    }
  }
  
  @IBInspectable var borderColor: UIColor {
    get {
      return UIColor.init(cgColor: layer.borderColor!)
    }
    set {
      layer.borderColor = newValue.cgColor
    }
  }
}
