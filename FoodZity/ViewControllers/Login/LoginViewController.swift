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
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        loginButton.backgroundColor = buttonColors.disable.value
        emailCheckImageView.image = nil
        passwordCheckImageView.image = nil
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        addToolbar()
    }
    
    @objc fileprivate func dismissKeyboard() {
        view.endEditing(true)
    }
    
    fileprivate func addToolbar() {
        let keyboardDoneButtonView = UIToolbar()
        keyboardDoneButtonView.barStyle = .default
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        keyboardDoneButtonView.setItems([doneButton], animated: false)
        keyboardDoneButtonView.sizeToFit()
        emailTextField.inputAccessoryView = keyboardDoneButtonView
        passwordTextField.inputAccessoryView = keyboardDoneButtonView
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: Notification.Name.UIKeyboardWillHide, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    func adjustForKeyboard(notification: Notification) {
        let userInfo = notification.userInfo!
        
        let keyboardScreenEndFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if notification.name == Notification.Name.UIKeyboardWillHide {
            scrollView.contentInset = UIEdgeInsets.zero
        } else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height, right: 0)
        }
        
        scrollView.scrollIndicatorInsets = scrollView.contentInset
        
        let selectedRange = passwordTextField.frame
        scrollView.scrollRectToVisible(selectedRange, animated: true)
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
    fileprivate func checkEmail(text: String?) -> Bool {
        //FIXME: - check email
        guard !(text?.isEmpty ?? true) else { return false }
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("11111111")
    }
    
    deinit {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
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
            emailCheckImageView.image = checkEmail(text: textField.text) ? UIImage(named: "check") : UIImage(named: "check_faild")
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
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
