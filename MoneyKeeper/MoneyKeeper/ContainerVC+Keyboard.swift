//
//  ContainerVC+Keyboard.swift
//  MoneyKeeper
//
//  Created by Đỗ Việt on 5/26/17.
//  Copyright © 2017 Do Viet. All rights reserved.
//

import UIKit

extension ContainerVC {
    func setStageForKeyboard(isOpenKeyboard: Bool) {
        if isOpenKeyBoard {
            keyBoardView.isHidden = false
        }
        UIView.animate(withDuration: 0.5, animations: {
            //self.configOpenKeyBoardStage()
            self.botConstrainKeyboardView.constant = isOpenKeyboard ? 0 : -self.keyBoardView.frame.height
            self.view.layoutIfNeeded()
        }, completion: { (isSuccess) in
            if !isOpenKeyboard {
                self.keyBoardView.isHidden = true
            }
        })
    }
    
    func changeKeyBoardStage() {
        isOpenKeyBoard = !isOpenKeyBoard
    }
}
