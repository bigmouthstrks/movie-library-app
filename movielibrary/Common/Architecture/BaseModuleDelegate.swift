//
//  BaseModuleDelegate.swift
//
//  Created by Benjamin Caceres on 01-07-20.
//  Copyright © 2022 Trust Technologies. All rights reserved.
//

import UIKit

// MARK: - BaseModuleDelegate
protocol BaseModuleDelegate: AnyObject {
    func onDismissRequested()
    func onGoBackRequested()
    func onModuleWillDisappear()
}

// MARK: - Default Impl
extension BaseModuleDelegate {
    func onDismissRequested() {}
    func onModuleWillDisappear() {}
}
