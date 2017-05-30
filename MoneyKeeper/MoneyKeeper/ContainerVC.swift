//
//  ContainerVC.swift
//  MoneyKeeper
//
//  Created by Đỗ Việt on 5/26/17.
//  Copyright © 2017 Do Viet. All rights reserved.
//

import UIKit

struct SegueIdentifier {
    static let embedMenuTabTableVC = "embedMenuTabTableVC"
    static let embedKeyboard       = "embedKeyboard"
    static let embedExpenseTabTableVC = "embedExpenseTabTableVC"
}

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
        registerNotification()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(changeKeyBoardStage), name: NSNotification.Name.init(rawValue: NotificationKey.toggleKeyBoard), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    var menuTabTableVC: MenuTabTableVC?
    var keyboardVC: KeyboardVC?
    var expenseTabTableVC: ExpenseTabTableVC?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case SegueIdentifier.embedMenuTabTableVC:
            menuTabTableVC = segue.destination as? MenuTabTableVC
        case SegueIdentifier.embedKeyboard:
            keyboardVC = segue.destination as? KeyboardVC
            keyboardVC?.delegate = expenseTabTableVC
        case SegueIdentifier.embedExpenseTabTableVC:
            expenseTabTableVC = segue.destination as? ExpenseTabTableVC
        default:
            break
        }
    }
}








