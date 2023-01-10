//
//  BackgroundColorable.swift
//  mitelco-superapp
//
//  Created by Benjamin Caceres on 28-10-20.
//

import UIKit

// MARK: - BackgroundColorable
protocol BackgroundColorable: AnyObject {
	@discardableResult func with(backgroundColor: UIColor) -> Self
}

extension UIView: BackgroundColorable {
	@discardableResult func with(backgroundColor: UIColor) -> Self {
		with { $0.backgroundColor = backgroundColor }
	}
}

extension UIViewController: BackgroundColorable {
	@discardableResult func with(backgroundColor: UIColor) -> Self {
		with { $0.view.with(backgroundColor: backgroundColor) }
	}
}
