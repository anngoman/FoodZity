//
//  LoginViewController.swift
//  FoodZity
//
//  Created by Uladzimir Yausei on 16.01.17.
//  Copyright © 2017 Anna Goman. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBOutlet weak var emailImageView: UIImageView!
    @IBOutlet weak var passwordImageView: UIImageView!
    @IBOutlet weak var emailCheckImageView: UIImageView!
    @IBOutlet weak var passwordCheckImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        loginButton.backgroundColor = buttonColors.disable.value
        emailCheckImageView.image = nil
        passwordCheckImageView.image = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func didPressedLoginButton(_ sender: UIButton) {
    }
    
    @IBAction func didPressedRegisterButton(_ sender: UIButton) {
    }
    
    @IBAction func didPressedForgotButton(_ sender: Any) {
    }
    
    @IBOutlet weak var didPressedContactUsButton: UIButton!
    
    
    
    fileprivate func loginButton(activate: Bool) {
        loginButton.backgroundColor = activate ? buttonColors.enable.value : buttonColors.disable.value
    }
    fileprivate func chechEmail(text: String?) -> Bool {
        //FIXME: - check email
        guard !(text?.isEmpty ?? true) else { return false }
        return true
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == emailTextField {
            emailImageView.image = UIImage(named: "email")
        } else {
            passwordImageView.image = UIImage(named: "lock")
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if  textField == emailTextField {
            emailCheckImageView.image = chechEmail(text: textField.text) ? UIImage(named: "check") : UIImage(named: "check_faild")
        } else {
            passwordCheckImageView.image = textField.text?.isEmpty ?? false ? UIImage(named: "check_faild") : UIImage(named: "check")
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let text = (textField.text ?? "") as NSString
        let endText = text.replacingCharacters(in: range, with: string)
        
        guard endText.characters.count > 0 else {
            loginButton(activate: false)
            return true
        }
        
        let anotherTextField: UITextField
        if textField == emailTextField {
            anotherTextField = passwordTextField
        } else {
            anotherTextField = emailTextField
        }
        
        loginButton(activate: (anotherTextField.text?.characters.count ?? 0) > 0 ? true : false)
        return true
    }

}

fileprivate enum buttonColors {
    case disable
    case enable
}

fileprivate extension buttonColors {
    var value: UIColor {
        get {
            switch self {
            case .disable:
                return UIColor(netHex: 0xd8dadc)
            case .enable:
                return UIColor(netHex: 0x7cb342)
            }
        }
    }
}
