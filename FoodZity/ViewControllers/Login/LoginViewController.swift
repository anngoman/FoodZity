//
//  LoginViewController.swift
//  FoodZity
//
//  Created by Anna Goman on 13.01.17.
//  Copyright © 2017 Anna Goman. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.setNavigationBarHidden(true, animated: true)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  

}
