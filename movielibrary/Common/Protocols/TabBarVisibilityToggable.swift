//
//  TabBarVisibilityToggable.swift
//  mitelco-superapp
//
//  Created by Benjamin Cáceres on 29-06-22.
//

import UIKit

// MARK: - TaBarVisibilityTogglable
protocol TabBarVisibilityTogglable: AnyObject {
	func showTabBar(animated: Bool)
	func hideTabBar(animated: Bool)
}

// MARK: - Default Implementation
extension TabBarVisibilityTogglable where Self: UIViewController {
	func showTabBar(animated: Bool = true) {
		guard let nc = navigationController else { return }
		nc.mainTabBarController?.tabBar.isHidden = false
	}

	func hideTabBar(animated: Bool = true) {
		guard let nc = navigationController else { return }
		nc.mainTabBarController?.tabBar.isHidden = true
	}
}
