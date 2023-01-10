//
//  UIViewController+SetCustomRightItem.swift
//  demonativeclaro
//
//  Created by Benjamin Cáceres on 13-12-22.
//

import UIKit

extension UIViewController {
	func setCustomRightItem(menuElements: [UIAction]) {
		let rightItem = UIBarButtonItem()
		let img2 = UIImage(systemName: "ellipsis")
		img2?.withTintColor(.dark)
		rightItem.tintColor = .dark

		rightItem.image = img2
		
		let menu = UIMenu(
			title: .empty,
			image: img2,
			identifier: UIMenu.Identifier("CustomNavBarMenu"),
			options: .displayInline,
			children: menuElements
		)
		
		rightItem.menu = menu
		
		navigationItem.setRightBarButton(rightItem, animated: false)
	}
}
