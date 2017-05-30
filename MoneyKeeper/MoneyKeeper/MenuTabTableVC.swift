//
//  MenuTabTableVC.swift
//  MoneyKeeper
//
//  Created by Đỗ Việt on 5/26/17.
//  Copyright © 2017 Do Viet. All rights reserved.
//

import UIKit

enum MenuCellType: Int {
    case expense
    case income
    case transfer
    case adjustment
    
    var index: IndexPath {
        return IndexPath(row: self.rawValue, section: 0)
    }
}

class MenuTabTableVC: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    var expenseTabTableVC: ExpenseTabTableVC?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellType = MenuCellType.init(rawValue: indexPath.row) else {
            return
        }
        
        switch cellType {
        case .expense:
            break
        default:
            break
        }
    }

}
