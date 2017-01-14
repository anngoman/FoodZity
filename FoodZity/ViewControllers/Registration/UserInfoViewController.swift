//
//  UserInfoViewController.swift
//  FoodZity
//
//  Created by Anna Goman on 10.01.17.
//  Copyright © 2017 Anna Goman. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
  @IBOutlet weak var termsButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  // MARK: - UI
  
  func configureUI() {
    let attrs = [
      NSFontAttributeName : UIFont.systemFont(ofSize: 12.0),
      NSForegroundColorAttributeName : UIColor.black,
      NSUnderlineStyleAttributeName : 1] as [String : Any]
    let attributedString = NSAttributedString(string: "Terms & Conditions", attributes: attrs)
    termsButton.setAttributedTitle(attributedString, for: .normal)
  }
  
  
  // MARK: - Actions
  
  @IBAction func nextStep(_ sender: Any) {
    performSegue(withIdentifier: SegueIdentifier.thirdStep.rawValue, sender: nil)
  }
  
  @IBAction func showInfo(_ sender: Any) {
    let infoAlert = ViewController.alert.instance(fromStoryboard: Storyboard.registration.instance)
    present(infoAlert, animated: false, completion: nil)
  }
}
