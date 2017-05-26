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
            UIView.animate(withDuration: 0.5, animations: {
                self.configOpenKeyBoardStage()
                self.view.layoutIfNeeded()
            }, completion: { (isSuccess) in
                
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.configCloseKeyBoardStage()
                self.view.layoutIfNeeded()
            }, completion: { (isSuccess) in
                self.keyBoardView.isHidden = true
            })
        }
    }
    
    func configOpenKeyBoardStage() {
        botConstrainKeyboardView.constant = 0
    }
    
    func configCloseKeyBoardStage() {
        botConstrainKeyboardView.constant = -keyBoardView.frame.height
    }
    
    func changeKeyBoardStage() {
        isOpenKeyBoard = !isOpenKeyBoard
    }
}
