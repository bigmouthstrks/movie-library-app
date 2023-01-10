//
//  UINavigationBar+CustomNavBar.swift
//  mitelco-superapp
//
//  Created by Benjamin Cáceres on 16-06-22.
//

import UIKit

// MARK: - UIViewController
extension UIViewController {
	func setupCustomNavBar(rightItemAction: @escaping CompletionHandler) {
		let rightItem = UIBarButtonItem()
			.with {
				$0.title = "Enviar"
				$0.tintColor = .black
			}
			.onTap {
				rightItemAction()
			}
		navigationItem.setRightBarButton(rightItem, animated: false)
	}
}
