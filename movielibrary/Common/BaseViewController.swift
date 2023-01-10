//
//  BaseViewController.swift
//  mitelco-superapp
//
//  Created by Benjamin Cáceres on 24-06-22.
//

import UIKit

// MARK: - BaseViewController
class BaseViewController: UIViewController {}

// MARK: - Default preferredStatusBarStyle
extension BaseViewController {
	override var preferredStatusBarStyle: UIStatusBarStyle { .lightContent }
}

// MARK: - Lifecycle
extension BaseViewController {
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.interactivePopGestureRecognizer?.delegate = self
		navigationController?.interactivePopGestureRecognizer?.isEnabled = true
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		mainTabBarController?.isStillAnimatingTransition = false
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		mainTabBarController?.isStillAnimatingTransition = true
	}
}

// MARK: - UIGestureRecognizerDelegate
extension BaseViewController: UIGestureRecognizerDelegate {
	func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool { true }
}
