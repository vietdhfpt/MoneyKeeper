//
//  ContainerVC.swift
//  MoneyKeeper
//
//  Created by Đỗ Việt on 5/26/17.
//  Copyright © 2017 Do Viet. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {

    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var buttonCover: UIButton!
    @IBOutlet weak var topConstrainMenuView: NSLayoutConstraint!
    var isOpenMenu: Bool = false {
        didSet {
            setMenuStage(with: isOpenMenu)
        }
    }
    
    // constrain keyBoard
    @IBOutlet weak var keyBoardView: UIView!
    @IBOutlet weak var botConstrainKeyboardView: NSLayoutConstraint!
    var isOpenKeyBoard: Bool = false {
        didSet {
            setStageForKeyboard(isOpenKeyboard: isOpenKeyBoard)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        isOpenMenu = false
        
        isOpenKeyBoard = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
