//
//  Extensions.swift
//  ExampleMVP
//
//  Created by EgorErmin on 03.03.2021.
//

import UIKit

extension UIViewController: UITextFieldDelegate {
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
