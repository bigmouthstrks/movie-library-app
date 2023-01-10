//
//  NavigationBarVisibilityTogglable.swift
//  mitelco-superapp
//
//  Created by Benjamin Caceres on 30-05-20.
//  Copyright © 2022 Trust Technologies. All rights reserved.
//

import Foundation
import UIKit

// MARK: - NavigationBarVisibilityTogglable
protocol NavigationBarVisibilityTogglable: AnyObject {
    func showNavigationBar(animated: Bool)
    func hideNavigationBar(animated: Bool)
}

// MARK: - Default implementation
extension NavigationBarVisibilityTogglable where Self: UIViewController {
    func showNavigationBar(animated: Bool = true) {
        guard let nc = navigationController, nc.isNavigationBarHidden else { return }
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    func hideNavigationBar(animated: Bool = true) {
        guard let nc = navigationController, !nc.isNavigationBarHidden else { return }
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
