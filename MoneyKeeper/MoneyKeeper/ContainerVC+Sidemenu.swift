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
            UIView.animate(withDuration: 0.5, animations: {
                self.configOpenMenuStage()
                self.view.layoutIfNeeded()
            }, completion: { (isSuccess) in
                
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.configCloseMenuStage()
                self.view.layoutIfNeeded()
            }, completion: { (isSuccess) in
                self.menuView.isHidden = true
                self.buttonCover.isHidden = true
            })
        }
    }
    
    func configView() {
        buttonCover.backgroundColor = UIColor.black
        buttonCover.addTarget(self, action: #selector(changeMenuStage), for: UIControlEvents.touchDown)
        // shadow
        menuView.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        menuView.layer.shadowOffset = CGSize(width: 10, height: 0)
        menuView.layer.shadowOpacity = 1
    }
    
    func configOpenMenuStage() {
        topConstrainMenuView.constant = 0
        buttonCover.alpha = 0.2
    }
    
    func configCloseMenuStage() {
        topConstrainMenuView.constant = -menuView.frame.height
        buttonCover.alpha = 0
    }
    
    func changeMenuStage() {
        isOpenMenu = !isOpenMenu
    }
    
    @IBAction func showMenu(_ sender: UIButton) {
        changeMenuStage()
    }
}
