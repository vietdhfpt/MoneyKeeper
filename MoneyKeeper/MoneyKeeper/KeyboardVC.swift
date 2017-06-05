//
//  KeyboardVC.swift
//  MoneyKeeper
//
//  Created by Đỗ Việt on 5/26/17.
//  Copyright © 2017 Do Viet. All rights reserved.
//

import UIKit

protocol KeyboardVCDelegate {
    func passedData(data: String)
    func shouldDismissKeyboard()
}

class KeyboardVC: UIViewController {

    var delegate: KeyboardVCDelegate?
    
    var resultData: String = "" {
        didSet {
            delegate?.passedData(data: resultData)
        }
    }
    
    var firstNumberText = ""
    var secondNumberText = ""
    var op = ""
    var isFirstNumber = true
    var hasOp = false
    var canClear = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func hiddenKeyboard(_ sender: UIButton) {
        delegate?.shouldDismissKeyboard()
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: NotificationKey.toggleKeyBoard), object: nil)
    }
    
    @IBAction func handleButtonPress(_ sender: UIButton) {
        let currentText = resultData
        let textLabel = sender.titleLabel?.text
        if let text = textLabel {
            switch text {
            case "+", "x", ":", "-":
                if hasOp {
                    return
                }
                op = text
                isFirstNumber = false
                hasOp = true
                resultData = "\(currentText) \(op) "
                break
            case "=":
                isFirstNumber = true
                hasOp = false
                canClear = true
                let result = calculate()
                resultData = "\(result)"
                break
            default:
                if isFirstNumber {
                    firstNumberText = "\(firstNumberText)\(text)"
                } else {
                    secondNumberText = "\(secondNumberText)\(text)"
                }
                resultData = "\(currentText)\(text)"
                break
            }
            
        }
    }
}
