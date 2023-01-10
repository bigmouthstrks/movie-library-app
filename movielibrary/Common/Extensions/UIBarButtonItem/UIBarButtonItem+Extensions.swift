//
//  UIBarButtonItem+Extensions.swift
//

import UIKit

// MARK: - UIBarButtonItem
extension UIBarButtonItem {
	@discardableResult func with(image: UIImage?) -> Self {
		with { $0.image = image }
	}
	
	@discardableResult func with(tintColor: UIColor) -> Self {
		with { $0.tintColor = tintColor }
	}
	
	@discardableResult func with(action: Selector) -> Self {
		with { $0.action = action }
	}
	
	@discardableResult func with(target: AnyObject) -> Self {
		with { $0.target = target }
	}
}
