//
//  UITextField+Padding.swift
//  mitelco-superapp
//
//  Created by Benjamin Cáceres on 24-05-22.
//

import UIKit

// MARK: - TextField
final class TextField: UITextField {
	var textPadding = UIEdgeInsets(
		top: 4,
		left: 8,
		bottom: 4,
		right: 8
	)
	
	init() {
		super.init(frame: CGRect())
		self.layer.cornerRadius = 4.0
		self.with(borderWidth: 0.4)
		self.with(borderColor: .appGray)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - TextField
extension TextField {
	@objc override func textRect(forBounds bounds: CGRect) -> CGRect {
		let rect = super.textRect(forBounds: bounds)
		return rect.inset(by: textPadding)
	}

	@objc override func editingRect(forBounds bounds: CGRect) -> CGRect {
		let rect = super.editingRect(forBounds: bounds)
		return rect.inset(by: textPadding)
	}
}
