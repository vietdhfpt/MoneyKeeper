//
//  KeyboardVC+calculate.swift
//  MoneyKeeper
//
//  Created by Hoàng Việt on 6/6/17.
//  Copyright © 2017 Do Viet. All rights reserved.
//

import Foundation

extension KeyboardVC {
    func calculate() -> Double {
        let firstNumber = Double(firstNumberText) ?? 0
        let secondNumber = Double(secondNumberText) ?? 0
        firstNumberText = ""
        secondNumberText = ""
        switch op {
        case "+":
            return firstNumber + secondNumber
        case "-":
            return firstNumber - secondNumber
        case "x":
            return firstNumber * secondNumber
        case ":":
            return firstNumber / secondNumber
        default:
            return 0
        }
    }
}
