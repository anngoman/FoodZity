//
//  AlertViewController.swift
//  FoodZity
//
//  Created by Anna Goman on 13.01.17.
//  Copyright © 2017 Anna Goman. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   // MARK: - Actions
  
  @IBAction func close(_ sender: Any) {
    dismiss(animated: false, completion: nil)
  }
  

}
