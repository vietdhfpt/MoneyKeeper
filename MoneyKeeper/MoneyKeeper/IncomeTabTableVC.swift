//
//  IncomeTabTableVC.swift
//  MoneyKeeper
//
//  Created by Hoàng Việt on 6/6/17.
//  Copyright © 2017 Do Viet. All rights reserved.
//

import UIKit

class IncomeTabTableVC: UITableViewController {

    static var instance: IncomeTabTableVC {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "IncomeTabTableVC") as! IncomeTabTableVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
