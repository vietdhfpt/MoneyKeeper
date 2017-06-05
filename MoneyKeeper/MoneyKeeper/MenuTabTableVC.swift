//
//  MenuTabTableVC.swift
//  MoneyKeeper
//
//  Created by Đỗ Việt on 5/26/17.
//  Copyright © 2017 Do Viet. All rights reserved.
//

import UIKit

class MenuTabTableVC: UITableViewController {
    // Cell
    @IBOutlet weak var expenseTabCell: UITableViewCell!
    @IBOutlet weak var incomeTabCell: UITableViewCell!
    @IBOutlet weak var transferTabCell: UITableViewCell!
    @IBOutlet weak var adjustmentTabCell: UITableViewCell!
    
    enum CellType: Int {
        case expenseTabCell
        case incomeTabCell
        case transferTabCell
        case adjustmentTabCell
    }
    
    var index = 0
    
    weak var pageVC: PageVC?
    weak var containerVC: ContainerVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if cell === expenseTabCell {
            pageVC?.jump(toIndex: 0)
        } else  if cell === incomeTabCell {
            pageVC?.jump(toIndex: index + 1)
        } else  if cell === transferTabCell {
            pageVC?.jump(toIndex: index + 2)
        } else  if cell === adjustmentTabCell {
            pageVC?.jump(toIndex: index + 3)
        }
    }

}
