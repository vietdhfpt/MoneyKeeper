//
//  ContainerVC+Sidemenu.swift
//  MoneyKeeper
//
//  Created by Đỗ Việt on 5/26/17.
//  Copyright © 2017 Do Viet. All rights reserved.
//

import UIKit

extension ContainerVC {
    func setMenuStage(with isOpenMenu: Bool) {
        if isOpenMenu {
            menuView.isHidden = false
            buttonCover.isHidden = false
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.topConstrainMenuView.constant = self.isOpenMenu ? 0 : -self.menuView.frame.height
            self.buttonCover.alpha = self.isOpenMenu ? 0.2 : 0
            self.view.layoutIfNeeded()
        }, completion: { (isSuccess) in
            if !isOpenMenu {
                self.menuView.isHidden = true
                self.buttonCover.isHidden = true
            }
        })
    }
    
    @IBAction func showMenu(_ sender: UIButton) {
        isOpenMenu = !isOpenMenu
    }
}
