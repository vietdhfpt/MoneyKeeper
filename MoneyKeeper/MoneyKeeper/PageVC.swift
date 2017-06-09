//
//  PageVC.swift
//  MoneyKeeper
//
//  Created by Hoàng Việt on 5/30/17.
//  Copyright © 2017 Do Viet. All rights reserved.
//

import UIKit

class PageVC: UIPageViewController {
    
    var modelController = BaseModelController()
    var startViewControllerIndex = 0
    var index = 0
    var expenseTabTableVC: ExpenseTabTableVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = modelController
        if let startingViewController: UIViewController = self.modelController.viewControllerAtIndex(startViewControllerIndex) {
            
            let viewControllers = [startingViewController]
            setViewControllers(viewControllers, direction: .forward, animated: false, completion: {done in })
        }
    }
    
    // page control
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            } else if view is UIPageControl {
                view.backgroundColor = UIColor.clear
            }
        }
        
        // set color for pageController
        let pageControl: UIPageControl = UIPageControl.appearance(whenContainedInInstancesOf: [PageVC.self])
        pageControl.currentPageIndicatorTintColor = hexStringToUIColor(hex: "2E938E")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func jump(toIndex: Int, animated: Bool = true) {
        guard toIndex != NSNotFound && toIndex >= 0 else {
            return
        }
        let direction : UIPageViewControllerNavigationDirection = toIndex > index ? .forward : .reverse
        if let viewController = modelController.viewControllerAtIndex(toIndex) {
            self.setViewControllers([viewController], direction: direction , animated: true, completion: {done in })
        }
    }
}

// MARK: Page control
extension PageVC: UIPageViewControllerDelegate {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return modelController.viewcontrollers.count
    }
}
