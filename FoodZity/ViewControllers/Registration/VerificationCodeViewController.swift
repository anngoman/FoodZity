//
//  VerificationCodeViewController.swift
//  FoodZity
//
//  Created by Anna Goman on 11.01.17.
//  Copyright © 2017 Anna Goman. All rights reserved.
//

import UIKit

class VerificationCodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  // MARK: - Action

  @IBAction func nextStep(_ sender: Any) {
    performSegue(withIdentifier: SegueIdentifier.fourthStep.rawValue, sender: nil)
  }
  
  @IBAction func showInfo(_ sender: Any) {
    let infoAlert = ViewController.alert.instance(fromStoryboard: Storyboard.registration.instance)
    present(infoAlert, animated: false, completion: nil)
  }
  
}
