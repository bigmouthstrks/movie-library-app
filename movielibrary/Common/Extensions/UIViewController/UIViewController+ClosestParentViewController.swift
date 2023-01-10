//
//  UIViewController+ClosestParentViewController.swift
//  mitelco-superapp
//
//  Created by Benjamin Cáceres on 24-06-22.
//

import UIKit

// MARK: - Closest Parent ViewController
extension UIViewController {
	func closestParentViewController(class someClass: AnyClass) -> UIViewController? {
		var viewController: UIViewController? = self

		while let someViewController = viewController {
			if someViewController.isKind(of: someClass) { return someViewController }
			viewController = someViewController.parent
		}

		return nil
	}
}
