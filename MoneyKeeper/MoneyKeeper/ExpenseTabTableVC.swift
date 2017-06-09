//
//  PayTabTableVC.swift
//  MoneyKeeper
//
//  Created by Đỗ Việt on 5/26/17.
//  Copyright © 2017 Do Viet. All rights reserved.
//

import UIKit

class ExpenseTabTableVC: UITableViewController {
    
    enum CellType: Int {
        case header0
        case input
        case header1
        case category
        case description
        case header2
        case account
        case date
        case payee
        case event
        case header3
        case borrowToPay
        case lender
        case header4
        case save
    }
    
    @IBOutlet weak var textFieldView: UIView!
    @IBOutlet weak var calculateTextField: UITextField!
    
    static var instance: ExpenseTabTableVC {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "ExpenseTabTableVC") as! ExpenseTabTableVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configRightViewTextField()
        calculateTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerNotification()
    }
    
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleHiddenKeyboard), name: NSNotification.Name.init(NotificationKey.toggleKeyboard), object: nil)
    }
    
    func handleHiddenKeyboard() {
        calculateTextField.resignFirstResponder()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.init(NotificationKey.toggleKeyboard), object: nil)
    }
    
    @IBAction func toggle(_ sender: UISwitch) {
        tableView.reloadData()
    }
    
    @IBOutlet weak var toggle: UISwitch!
    @IBOutlet weak var lenderCell: UITableViewCell!
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case CellType.lender.rawValue:
            lenderCell.backgroundColor = UIColor.white
            return toggle.isOn ? 44 : 0
        case CellType.input.rawValue:
            return 68
        case CellType.header0.rawValue, CellType.header1.rawValue, CellType.header2.rawValue, CellType.header3.rawValue, CellType.header4.rawValue:
            return 8
        default:
            return 44
        }
    }
}
