//
//  Constants.swift
//  FoodZity
//
//  Created by Anna Goman on 10.01.17.
//  Copyright © 2017 Anna Goman. All rights reserved.
//

import UIKit

struct ColorPalette {
  static let green = UIColor(red: 124/255.0, green: 179/255.0, blue: 66/255.0, alpha: 1.0)//7cb342
}

enum Storyboard: String {
  case main = "Main"
  case registration = "Registration"
  
  var instance: UIStoryboard {
    return UIStoryboard(name: self.rawValue, bundle: nil)
  }
  
}

enum ViewController: String {
  case alert = "AlertVC"
  
  func instance(fromStoryboard storyBoard: UIStoryboard) -> UIViewController {
    return storyBoard.instantiateViewController(withIdentifier: self.rawValue)
  }
}


enum SegueIdentifier: String {
  case secondStep = "SecondStepSegue"
  case thirdStep = "ThirdStepSegue"
  case fourthStep = "FourthStepSegue"
  case verificationCode = "VerificationCodeSegue"
}

enum CellIdentifier: String {
  case store = "StoreCell"
}
