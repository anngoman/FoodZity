//
//  RegistrationViewController.swift
//  FoodZity
//
//  Created by Anna Goman on 10.01.17.
//  Copyright © 2017 Anna Goman. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 // MARK: - Actions
  
  @IBAction func nextStep(_ sender: Any) {
    performSegue(withIdentifier: SegueIdentifier.secondStep.rawValue, sender: nil)
  }
  
  @IBAction func showInfo(_ sender: Any) {
    let infoAlert = ViewController.alert.instance(fromStoryboard: Storyboard.registration.instance)
    present(infoAlert, animated: false, completion: nil)
  }
  

}
