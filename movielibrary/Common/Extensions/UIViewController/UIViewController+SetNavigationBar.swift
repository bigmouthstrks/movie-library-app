//
//  UIViewController+SetNavigationBar.swift
//

import UIKit

// MARK: - UIViewController Extension
extension UIViewController {
	func setNavigationBar(
		theme: NavigationBarTheme = .white,
		barButtonItemFont: UIFont? = nil,
		hasShadow: Bool = false,
		isTranslucent: Bool = false
	) {
		setNavigationBar(
			backgroundColor: theme.backgroundColor,
			titleColor: theme.titleColor,
			titleFont: theme.titleFont,
			largeTitleFont: theme.largeTitleFont,
			leftBarButtomItemTintColor: theme.leftBarButtomItemTintColor,
			rightBarButtomItemTintColor: theme.rightBarButtomItemTintColor,
			barButtonItemFont: barButtonItemFont,
			hasShadow: hasShadow,
			isTranslucent: isTranslucent
		)
	}

	func setNavigationBar(
		backgroundColor: UIColor = NavigationBarTheme.DefaultValues.backgroundColor,
		titleColor: UIColor = NavigationBarTheme.DefaultValues.titleColor,
		titleFont: UIFont = NavigationBarTheme.DefaultValues.titleFont,
		largeTitleFont: UIFont = NavigationBarTheme.DefaultValues.largeTitleFont,
		leftBarButtomItemTintColor: UIColor? = NavigationBarTheme.DefaultValues.leftBarButtomItemTintColor,
		rightBarButtomItemTintColor: UIColor? = NavigationBarTheme.DefaultValues.rightBarButtomItemTintColor,
		barButtonItemFont: UIFont? = nil,
		hasShadow: Bool = true,
		isTranslucent: Bool = false
	) {
		guard let navigationBar = navigationController?.navigationBar else { return }

		let standardAppearance = UINavigationBarAppearance()
		standardAppearance.configureWithOpaqueBackground()
		standardAppearance.backgroundColor = backgroundColor
		
		standardAppearance.titleTextAttributes = [
			.font: titleFont,
			.foregroundColor: titleColor
		]

		standardAppearance.largeTitleTextAttributes = [
			.font: largeTitleFont,
			.foregroundColor: titleColor
		]

		let compactAppearance = standardAppearance.copy()
		navigationBar.standardAppearance = standardAppearance
		navigationBar.scrollEdgeAppearance = standardAppearance
		navigationBar.compactAppearance = compactAppearance

		navigationBar.compactScrollEdgeAppearance = compactAppearance
		navigationBar.isTranslucent = isTranslucent

		if !hasShadow {
			navigationBar.setBackgroundImage(UIImage(), for: .default)
			navigationBar.shadowImage = UIImage()
			navigationBar.layoutIfNeeded()
			navigationBar.compactAppearance?.shadowColor = .clear
			navigationBar.scrollEdgeAppearance?.shadowColor = .clear
			navigationBar.standardAppearance.shadowColor = .clear
		}

		navigationItem.leftBarButtonItems?
			.compactMap { $0 }
			.forEach {
				if let leftBarButtomItemTintColor = leftBarButtomItemTintColor { $0.tintColor = leftBarButtomItemTintColor }

				if let barButtonItemFont = barButtonItemFont {
					$0.setTitleTextAttributes(
						[.font: barButtonItemFont],
						for: .normal
					)
				}
			}

		navigationItem.rightBarButtonItems?
			.compactMap { $0 }
			.forEach {
				if let rightBarButtomItemTintColor = rightBarButtomItemTintColor { $0.tintColor = rightBarButtomItemTintColor }

				if let barButtonItemFont = barButtonItemFont {
					$0.setTitleTextAttributes(
						[.font: barButtonItemFont],
						for: .normal
					)
				}
			}
	}
}

// MARK: - NavigationBarTheme
enum NavigationBarTheme {
	case blue
	case white

	// MARK: - DefaultValues
	enum DefaultValues {
		static var backgroundColor: UIColor { .white }
		static var titleColor: UIColor { .white }
		static var titleFont: UIFont { UIFont.systemFont(ofSize: 18.0, weight: .regular) }
		static var largeTitleFont: UIFont { UIFont.systemFont(ofSize: 22.0, weight: .regular) }
		static var leftBarButtomItemTintColor: UIColor { .white }
		static var rightBarButtomItemTintColor: UIColor { .white }
	}

	var backgroundColor: UIColor {
		switch self {
		case .blue: return .white
		case .white: return DefaultValues.backgroundColor
		}
	}

	var titleColor: UIColor {
		switch self {
		case .blue: return .white
		case .white: return DefaultValues.titleColor
		}
	}

	var titleFont: UIFont { DefaultValues.titleFont }
	var largeTitleFont: UIFont { DefaultValues.largeTitleFont }

	var leftBarButtomItemTintColor: UIColor {
		switch self {
		case .blue: return .white
		case .white: return DefaultValues.leftBarButtomItemTintColor
		}
	}

	var rightBarButtomItemTintColor: UIColor {
		switch self {
		case .blue: return DefaultValues.rightBarButtomItemTintColor
		case .white: return .white
		}
	}
}
