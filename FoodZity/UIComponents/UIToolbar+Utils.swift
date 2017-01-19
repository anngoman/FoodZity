//
//  UIToolbar+Utils.swift
//  FoodZity
//
//  Created by Uladzimir Yausei on 18.01.17.
//  Copyright © 2017 Anna Goman. All rights reserved.
//

import UIKit

extension UIToolbar {
    class func doneToolBar(target: Any?, action: Selector?) -> UIToolbar {
        let doneToolBar = UIToolbar()
        doneToolBar.barStyle = .default
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: target, action: action)
        doneToolBar.setItems([doneButton], animated: false)
        doneToolBar.sizeToFit()
        
        return doneToolBar
    }
}
