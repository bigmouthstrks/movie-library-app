//
//  UITextField+Extensions.swift
//

import UIKit

// MARK: - UITextField
extension UITextField {
	@discardableResult func with(text: String?) -> Self {
		with { $0.text = text }
	}
	
	@discardableResult func with(textColor: UIColor) -> Self {
		with { $0.textColor = textColor }
	}
	
	@discardableResult func with(font: UIFont) -> Self {
		with { $0.font = font }
	}
	
	@discardableResult func with(translatesAutoresizingMask: Bool) -> Self {
		with { $0.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMask }
	}
	
	@discardableResult func with(placeholder: String, ofColor color: UIColor) -> Self {
		with {
			$0.attributedPlaceholder = NSAttributedString(
				string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: color]
			)
		}
	}
	
	@discardableResult func with(cornerRadius: Double) -> Self {
		with { $0.layer.cornerRadius = cornerRadius }
	}
	
	@discardableResult func with(borderWidth: Double) -> Self {
		with { $0.layer.borderWidth = borderWidth }
	}
	
	@discardableResult func with(borderColor: UIColor) -> Self {
		with { $0.layer.borderColor = borderColor.cgColor }
	}
	
	@discardableResult func inset(by: UIEdgeInsets) -> Self {
		with { $0.textRect(forBounds: bounds.inset(by: by)) }
	}
	
	@discardableResult func with(textAlignment: NSTextAlignment) -> Self {
		with { $0.textAlignment = textAlignment }
	}
	
	
	@discardableResult func with(textContentType: UITextContentType) -> Self {
		with { $0.textContentType = textContentType }
	}
	
	
	@discardableResult func ofType(_ type: UITextFieldType) -> Self {
		with {
			switch type {
			case .email: $0.keyboardType = .emailAddress
			case .password: $0.isSecureTextEntry = true
			case .number: $0.keyboardType = .numberPad
			case .text: $0.keyboardType = .default
			}
			
			$0.layer.borderColor = UIColor.gray.cgColor
			$0.layer.borderWidth = 0.3
			$0.textColor = .dark
			$0.textAlignment = .left
			$0.layer.cornerRadius = 8.0
			$0.font = .systemFont(ofSize: 16.0)
			$0.backgroundColor = .coldNeutral1
			$0.translatesAutoresizingMaskIntoConstraints = false
			$0.heightAnchor.constraint(equalToConstant: 48.0).isActive = true
			$0.layoutMargins = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
		}
	}
}

// MARK: - UITextFieldType
enum UITextFieldType {
	case email
	case password
	case number
	case text
}
