//
//  UILabel+CustomSetup.swift
//  mitelco-superapp
//
//  Created by Benjamin Cáceres on 04-05-22.
//

import UIKit

// MARK: - UILabel type
extension UILabel {
	convenience init(type: LabelType, color: LabelColor) {
		self.init()
		self.translatesAutoresizingMaskIntoConstraints = false
		
		if color == .light {
			self.textColor = .coldNeutral1
		} else {
			self.textColor = .primary
		}
		
		switch type {
		case .title:
			self.numberOfLines = 1
			self.font = .systemFont(ofSize: 32.0, weight: .bold)
			self.lineBreakMode = .byClipping
			self.adjustsFontSizeToFitWidth = false
		case .subtitle:
			self.numberOfLines = 0
			self.font = .systemFont(ofSize: 24.0, weight: .light)
			self.lineBreakMode = .byWordWrapping
			self.adjustsFontSizeToFitWidth = true
		case .content:
			self.numberOfLines = 0
			self.font = .systemFont(ofSize: 18.0, weight: .light)
			self.lineBreakMode = .byWordWrapping
			self.adjustsFontSizeToFitWidth = false
		}
	}
}

// MARK: - LabelType
enum LabelType: String {
	case title
	case subtitle
	case content
}

// MARK: - LabelColor
enum LabelColor {
	case light
	case dark
}
