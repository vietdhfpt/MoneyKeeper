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
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: NotificationKey.toggleKeyboard), object: nil)
        return true
    }
}

// MARK: - payment delegate
extension ExpenseTabTableVC: KeyboardVCDelegate {
    func passedData(data: String) {
        calculateTextField.text = data
    }
}

// MARK: - Config right image textfield
extension ExpenseTabTableVC {
    func configRightViewTextField() {
        calculateTextField.rightView = textFieldView
        calculateTextField.rightViewMode = .always
    }
}
