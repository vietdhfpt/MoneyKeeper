//
//  ContainerVC+Delegate.swift
//  MoneyKeeper
//
//  Created by Hoàng Việt on 6/9/17.
//  Copyright © 2017 Do Viet. All rights reserved.
//

import Foundation

extension ContainerVC: MenuTabTableVCDelegate {
    func passedIndexOfPageVC(toIndex: Int) {
        pageVC?.jump(toIndex: toIndex)
        isOpenMenu = false
    }
}
