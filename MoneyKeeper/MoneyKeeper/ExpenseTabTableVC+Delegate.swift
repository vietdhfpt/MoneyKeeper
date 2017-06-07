//
//  PayTabTableVC+delegate.swift
//  MoneyKeeper
//
//  Created by Đỗ Việt on 5/26/17.
//  Copyright © 2017 Do Viet. All rights reserved.
//

import UIKit

extension ExpenseTabTableVC: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: NotificationKey.toggleKeyBoard), object: nil)
        calculateTextField.resignFirstResponder()
        return true
    }
}

// MARK: - payment delegate
extension ExpenseTabTableVC: KeyboardVCDelegate {
    func passedData(data: String) {
        calculateTextField.text = data
    }
    
    func shouldDismissKeyboard() {
        calculateTextField.resignFirstResponder()
    }
}

// MARK: - Config right image textfield
extension ExpenseTabTableVC {
    func configRightViewTextField() {
        calculateTextField.rightView = textFieldView
        calculateTextField.rightViewMode = .always
    }
}
