//
//  UIButton+SetupWithOptions.swift
//  mitelco-superapp
//
//  Created by Benjamin Cáceres on 04-05-22.
//

import UIKit

// MARK: - UIButton
extension UIButton {
	convenience init(using config: ButtonConfig, and fontConfig: FontConfig) {
		self.init()
		self.setTitle(config.title, for: config.state)
		self.setTitleColor(fontConfig.color, for: config.state)
		self.layer.cornerRadius = config.cornerRadius
		self.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontConfig.size), weight: fontConfig.weight)
		self.backgroundColor = config.backgroundColor
		self.tintColor = fontConfig.color
		self.clipsToBounds = true
		self.translatesAutoresizingMaskIntoConstraints = false
	}
	
	func setup(using config: ButtonConfig, and fontConfig: FontConfig) {
		self.setTitle(config.title, for: config.state)
		self.setTitleColor(fontConfig.color, for: config.state)
		self.layer.cornerRadius = config.cornerRadius
		self.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(fontConfig.size), weight: fontConfig.weight)
		self.backgroundColor = config.backgroundColor
		self.tintColor = fontConfig.color
		self.clipsToBounds = true
		self.translatesAutoresizingMaskIntoConstraints = false
		
		

	}
}

// MARK: - FontConfig
struct FontConfig {
	var size: Double
	var weight: UIFont.Weight
	var color: UIColor
}

// MARK: - ButtonConfig
struct ButtonConfig {
	var title: String
	var cornerRadius: Double
	var backgroundColor: UIColor
	var state: UIControl.State
}

// MARK: - FontConfig
extension FontConfig {
	static var regular: FontConfig { return FontConfig(size: 16.0, weight: .regular, color: .primary) }
	static var regularLight: FontConfig { return FontConfig(size: 16.0, weight: .regular, color: .white) }
	static var boldDark: FontConfig { return FontConfig(size: 16.0, weight: .bold, color: .black) }
}

// MARK: - ButtonConfig
extension ButtonConfig {
	static func defaultDark(title: String) -> ButtonConfig {
		return ButtonConfig(title: title, cornerRadius: 12.0, backgroundColor: .primary, state: .normal)
	}
	
	static func defaultLight(title: String) -> ButtonConfig {
		return ButtonConfig(title: title, cornerRadius: 12.0, backgroundColor: .white, state: .normal)
	}
}
