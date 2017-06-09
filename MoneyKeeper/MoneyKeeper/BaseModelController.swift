//
//  BaseModelController.swift
//  MoneyKeeper
//
//  Created by Hoàng Việt on 6/6/17.
//  Copyright © 2017 Do Viet. All rights reserved.
//

import UIKit

class BaseModelController: NSObject, UIPageViewControllerDataSource {
    var viewcontrollers: [UIViewController] = {
        let expenseTab = ExpenseTabTableVC.instance
        let incomeTab = IncomeTabTableVC.instance
        let transferTab = TransferTabTableVC.instance
        let adjustmentTab = AdjustmentTabTableVC.instance
        
        let menuControllers = [expenseTab, incomeTab, transferTab, adjustmentTab]
        return menuControllers
    }()
    
    var index = 0
    
    func viewControllerAtIndex(_ index: Int) -> UIViewController? {
        // Return the data view controller for the given index.
        if (self.viewcontrollers.count == 0) || (index >= self.viewcontrollers.count) || (index < 0) {
            return nil
        }
        self.index = index
        
        return viewcontrollers[index]
    }
    
    func indexOfViewController(_ viewController: UIViewController) -> Int {
        return viewcontrollers.index(of: viewController) ?? NSNotFound
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController)
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = self.indexOfViewController(viewController)
        if index == NSNotFound {
            return nil
        }
        
        index += 1
        if index == self.viewcontrollers.count {
            return nil
        }
        return self.viewControllerAtIndex(index)
    }
    
}
