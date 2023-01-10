//
//  UIViewController.swift
//  mitelco-superapp
//
//  Created by Benjamin Cáceres on 24-05-22.
//

import UIKit

// MARK: - UIViewController
extension UIViewController {
	func setBackButton() {
		let backButton = UIBarButtonItem()
		backButton.image = .Icons.arrowBackwards
		backButton.tintColor = .darkGray
		backButton.with(tintColor: .darkGray)
		backButton.onTap { self.navigationController?.popViewController(animated: true) }
		
		self.navigationItem.leftBarButtonItem = backButton
	}
}
