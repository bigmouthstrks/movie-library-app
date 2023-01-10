//
//  AlertViewable.swift
//  mitelco-superapp
//
//  Created by Benjamin Cáceres on 23-06-22.
//

// MARK: - AlertRequestable
protocol AlertRequestable: AnyObject {
	func onPresentAlertRequested(title: String, message: String, handler: CompletionHandler?, cancelHandler: CompletionHandler?)
//	func onPresentAlertRequested(viewModel: AlertViewModelProtocol)
}

// MARK: - where Self: AlertPresentable
extension AlertRequestable where Self: AlertPresentable {
	func onPresentAlertRequested(title: String = .defaultAlertTitle, message: String, handler: CompletionHandler? = nil, cancelHandler: CompletionHandler? = nil) {
		presentAlertView(
			type: .customAlert(title: title, message: message),
			acceptAction: handler != nil ? { _ in handler?() } : nil,
			cancelAction: cancelHandler != nil ? { _ in cancelHandler?() } : nil
		)
	}
}

// MARK: - where Self: BaseCoordinator
extension AlertRequestable where Self: BaseCoordinator {
//	func onPresentAlertRequested(viewModel: AlertViewModelProtocol) {
//		presentCustomAlertView(viewModel: viewModel, delegate: self)
//	}
}
