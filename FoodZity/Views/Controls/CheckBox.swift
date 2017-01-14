//
//  CheckBox.swift
//  FoodZity
//
//  Created by Anna Goman on 12.01.17.
//  Copyright © 2017 Anna Goman. All rights reserved.
//

import UIKit

class CheckBox: UIButton {
  var checked: ((_ isChecked: Bool) -> ())?
  var isChecked = false {
    didSet {
      self.setBackgroundImage(isChecked ? UIImage(named: "check") : UIImage(named: "unchecked"), for: .normal)

    }
  }

  // MARK: - Init

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.initialize()
  }
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    self.initialize()
  }
  
  convenience init() {
    self.init(frame: .zero)
    self.initialize()
  }
  
  func initialize() {
    self.addTarget(self, action: #selector(tap), for: .touchUpInside)
    self.setBackgroundImage(UIImage(named: "unchecked"), for: .normal)
  }
  
  // MARK: - Action
  
  func tap() {
    isChecked = !isChecked
    if let checked = checked {
      checked(isChecked)
    }
  }
}
