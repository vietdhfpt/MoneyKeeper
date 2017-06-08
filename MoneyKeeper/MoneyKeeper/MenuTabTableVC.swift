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
    var title: String? {get set}
}

class MenuTabTableVC: UITableViewController {
    // Cell
    @IBOutlet weak var expenseTabCell: UITableViewCell!
    @IBOutlet weak var incomeTabCell: UITableViewCell!
    @IBOutlet weak var transferTabCell: UITableViewCell!
    @IBOutlet weak var adjustmentTabCell: UITableViewCell!
    
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
        let cell = tableView.cellForRow(at: indexPath)
        let text = cell?.textLabel?.text ?? ""
        delegate?.passedIndexOfPageVC(toIndex: indexPath.row)
        delegate?.title = text
    }
}
