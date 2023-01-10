//
//  AlertPresentable.swift
//

import UIKit

// MARK: - AlertViewTypes
enum AlertViewTypes {
	case emptyAlert
	case genericError
	case customAlert(title: String, message: String)
	case customMessage(message: String)
}

// MARK: - AlertPresentable
protocol AlertPresentable: AnyObject {
	var viewController: UIViewController? { get }
	func presentAlertView(type: AlertViewTypes, acceptAction: ((UIAlertAction) -> Void)?, cancelAction: ((UIAlertAction) -> Void)?)
}

// MARK: - Default Implementation
extension AlertPresentable {
	var viewController: UIViewController? { UIApplication.shared.topMostViewController() }
	
	func presentAlertView(type: AlertViewTypes, acceptAction: ((UIAlertAction) -> Void)? = nil, cancelAction: ((UIAlertAction) -> Void)? = nil) {
		var alertTitle: String = .defaultAlertTitle
		var alertMessage: String = .empty

		switch type {
		case .genericError: alertMessage = .defaultAlertMessage
		case .customMessage(let message): alertMessage = message
		case .customAlert(let title, let message):
			alertTitle = title
			alertMessage = message
		case .emptyAlert: break
		}

		let alertController = UIAlertController(
			title: alertTitle,
			message: alertMessage,
			preferredStyle: .alert
		)
			
		alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.lightPurple

		let acceptAlertAction = UIAlertAction(
			title: .defaultAcceptActionTitle,
			style: .default,
			handler: acceptAction
		)

		alertController.addAction(acceptAlertAction)

		if let cancelAction = cancelAction {
			let cancelAlertAction = UIAlertAction(
				title: .cancel,
				style: .cancel,
				handler: cancelAction
			)

			alertController.addAction(cancelAlertAction)
		}

		applyDefaultAlertStyle(
			to: alertController,
			alertTitle: alertTitle,
			alertMessage: alertMessage
		)

		guard viewController is UIAlertController else {
			viewController?.present(
				alertController,
				animated: true
			)

			return
		}

		viewController?.dismiss(animated: false) {
			self.viewController?.present(
				alertController,
				animated: true
			)
		}
	}

	private func applyDefaultAlertStyle(to alertController: UIAlertController, alertTitle: String, alertMessage: String) {
		alertController.view.tintColor = .primary

		let titleFont: UIFont = .init(name: "Urbanist-Light", size: 22)!
		
		let attributedTitle = NSMutableAttributedString(
			string: alertTitle,
			attributes: [
				.font: titleFont,
				.foregroundColor: UIColor.dark
			]
		)
		
		alertController.setValue(
			attributedTitle,
			forKey: "attributedTitle"
		)

		let regularFont: UIFont = .title

		let attributedMessage = NSMutableAttributedString(
			string: alertMessage,
			attributes: [
				.font: regularFont,
				.foregroundColor: UIColor(white: 33.0 / 255.0, alpha: 1.0)
			]
		)

		alertController.setValue(
			attributedMessage,
			forKey: "attributedMessage"
		)
	}
}

// MARK: - where Self: UIViewController
extension AlertPresentable where Self: UIViewController {
	var viewController: UIViewController { self }
}
