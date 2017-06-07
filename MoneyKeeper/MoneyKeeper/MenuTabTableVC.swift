//
//  MenuTabTableVC.swift
//  MoneyKeeper
//
//  Created by Đỗ Việt on 5/26/17.
//  Copyright © 2017 Do Viet. All rights reserved.
//

import UIKit

protocol MenuTabTableVCDelegate {
    func passedIndexOfPageVC(toIndex: Int)
    func shouldDismissSideMenu()
    func nameTitleOfMenuTab(title: String)
}

class MenuTabTableVC: UITableViewController {
    // Cell
    @IBOutlet weak var expenseTabCell: UITableViewCell!
    @IBOutlet weak var incomeTabCell: UITableViewCell!
    @IBOutlet weak var transferTabCell: UITableViewCell!
    @IBOutlet weak var adjustmentTabCell: UITableViewCell!
    
    var index = 0
    
    var delegate: MenuTabTableVCDelegate?
    
    weak var pageVC: PageVC?
    weak var containerVC: ContainerVC?
    
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
        var cell = tableView.cellForRow(at: indexPath)
        if cell === expenseTabCell {
            delegate?.passedIndexOfPageVC(toIndex: index)
            delegate?.shouldDismissSideMenu()
            cell = tableView.cellForRow(at: indexPath)
            let text = cell?.textLabel?.text
            delegate?.nameTitleOfMenuTab(title: text!)
        } else  if cell === incomeTabCell {
            delegate?.passedIndexOfPageVC(toIndex: index + 1)
            delegate?.shouldDismissSideMenu()
            cell = tableView.cellForRow(at: indexPath)
            let text = cell?.textLabel?.text
            delegate?.nameTitleOfMenuTab(title: text!)
        } else  if cell === transferTabCell {
            delegate?.passedIndexOfPageVC(toIndex: index + 2)
            delegate?.shouldDismissSideMenu()
            cell = tableView.cellForRow(at: indexPath)
            let text = cell?.textLabel?.text
            delegate?.nameTitleOfMenuTab(title: text!)
        } else  if cell === adjustmentTabCell {
            delegate?.passedIndexOfPageVC(toIndex: index + 3)
            delegate?.shouldDismissSideMenu()
            cell = tableView.cellForRow(at: indexPath)
            let text = cell?.textLabel?.text
            delegate?.nameTitleOfMenuTab(title: text!)
        }
    }
}
