//
//  PayTabTableVC.swift
//  MoneyKeeper
//
//  Created by Đỗ Việt on 5/26/17.
//  Copyright © 2017 Do Viet. All rights reserved.
//

import UIKit

class ExpenseTabTableVC: UITableViewController {

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
}
