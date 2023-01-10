//
//  UIButton+Extensions.swift
//

import UIKit

// MARK: - UIButton
extension UIButton {
	@discardableResult func with(image: UIImage?, for state: State = .normal) -> Self {
		with { $0.setImage(image, for: state) }
	}
}

extension UIButton {
	@discardableResult func title(_ title: String?, for state: State = .normal) -> Self {
		with { $0.setTitle(title, for: state) }
	}
	
	@discardableResult func with(translatesAutoresizingMask: Bool) -> Self {
		with { $0.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMask }
	}
}

extension UIButton {
	typealias Action = () -> Void

	private var onTap: Action? {
		get { associatedObject(for: "onTapAction") as? Action }
		set { set(associatedObject: newValue, for: "onTapAction") }
	}

	func onTap(_ action: @escaping Action) -> Self {
		with {
			$0.onTap = action
			addTarget($0, action: #selector(didTouchUpInside), for: .touchUpInside)
		}
	}

	@objc private func didTouchUpInside() {
		onTap?()
	}
}

extension UIBarButtonItem {
	typealias Action = () -> Void

	private var onTap: Action? {
		get { associatedObject(for: "onTapAction") as? Action }
		set { set(associatedObject: newValue, for: "onTapAction") }
	}

	func onTap(_ action: @escaping Action) -> Self {
		with {
			$0.onTap = action
			$0.target = $0
			$0.action = #selector(didTouchUpInside)
		}
	}

	@objc private func didTouchUpInside() {
		onTap?()
	}
}

// MARK: - UIButton Extension
extension UIButton {
	@discardableResult func set(adjustsFontSizeToFitWidth: Bool) -> Self {
		with { $0.titleLabel?.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth }
	}
	
	@discardableResult func with(cornerRadius: Double) -> Self {
		with { $0.layer.cornerRadius = cornerRadius }
	}
	
	@discardableResult func with(tintColor: UIColor) -> Self {
		with { $0.tintColor = tintColor }
	}
	
	@discardableResult func with(fontSize: Double) -> Self {
		with { $0.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)}
	}
	
	@discardableResult func setTitleColor(color: UIColor, for state: State) -> Self {
		with { $0.setTitleColor(color, for: state) }
	}
	
	@discardableResult func theme(_ theme: UIButtonTheme) -> Self {
		with {
			$0.titleLabel?.adjustsFontSizeToFitWidth = true
			$0.layer.cornerRadius = 12
			$0.titleLabel?.font = .mdRegular
			switch theme {
			case .light:
				$0.tintColor = .primary
				$0.setTitleColor(.primary, for: .normal)
				$0.backgroundColor = .white
				$0.layer.borderWidth = 1.0
				$0.layer.borderColor = UIColor.buttonBorder.cgColor
			case .dark:
				$0.tintColor = .white
				$0.setTitleColor(.white, for: .normal)
				$0.backgroundColor = .primary
			case .outlined:
				$0.tintColor = .decline
				$0.setTitleColor(color: .decline, for: .normal)
				$0.backgroundColor = .none
				$0.titleLabel?.contentMode = .center
				$0.layer.borderColor = UIColor.buttonBorder.cgColor
				$0.layer.borderWidth = 1.0
			}
		}
	}
}

// MARK: - UIButton+AddLeftImage
extension UIButton {
	@discardableResult func addLeft(image: UIImage?) -> Self {
		with {
			guard let image = image else { return }

			$0.setImage(image, for: .normal)

			let buttonWidth = $0.frame.width
			let labelWidth = $0.titleLabel?.frame.width ?? .zero
			let widthDifference = buttonWidth - labelWidth
			let imageWidth = image.size.width
			let factor = floor((widthDifference/imageWidth)/2)
			let rightInset = floor(imageWidth * factor)
			
			imageEdgeInsets = UIEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: 16)
		}
	}
}

// MARK: - UIButtonTheme
enum UIButtonTheme {
	case light
	case dark
	case outlined
}
