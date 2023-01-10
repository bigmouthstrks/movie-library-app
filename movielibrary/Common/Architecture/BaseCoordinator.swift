//
//  BaseCoordinator.swift
//

import UIKit

// MARK: - BaseCoordinator
class BaseCoordinator: NSObject, Coordinator, BaseCoordinatorParent, BaseModuleDelegate {
	let navigationController: UINavigationController

	init(navigationController: @autoclosure () -> UINavigationController) {
		self.navigationController = navigationController()
	}

	private var childCoordinators: [Coordinator] = []
	@objc 
	private lazy var queue: DispatchQueue = {
		.init(
			label: "\(Bundle.main.bundleIdentifier ?? "*").\(self).queue",
			attributes: .concurrent
		)
	}()

	// MARK: - Coordinator
	func start() {}


	// MARK: - BaseCoordinatorParent

	/// By default it removes the received coordinator from child coordinators.
	/// - parameter T: Coordinator Type placeholder
	/// - parameter coordinator: Coordinator that performed the current onProcessDone method call
	func onProcessDone<T>(by coordinator: T) where T: Coordinator {
		removeChild(coordinator: coordinator)
	}

	// MARK: - BaseModuleDelegate

	/// By default it dismisses the currently presented view controller, if there is any,
	func onDismissRequested() { dismissPresentedViewController(completion: {}) }

	/// By default it pops the top view controller from the navigation controller.
	func onGoBackRequested() { navigationController.popViewController(animated: true) }
}

// MARK: - Convenience child coordinators methods
extension BaseCoordinator {
	func addChild<T>(coordinator: T) where T: Coordinator {
		removeChild(coordinator: coordinator)
		queue.async(flags: .barrier) {
			self.childCoordinators.append(coordinator)
		}
	}

	func addChildAndStart<T>(coordinator: T) where T: Coordinator {
		addChild(coordinator: coordinator)
		coordinator.start()
	}

	func getChild<T>(of type: T.Type) -> T? where T: Coordinator {
		return queue.sync { self.childCoordinators.getFirst(of: T.self) }
	}

	func removeChild<T>(coordinator: T) where T: Coordinator {
		guard childCoordinators.contains(where: { $0 is T }) else { return }
		queue.async(flags: .barrier) { self.childCoordinators.removeAll(of: T.self) }
	}
}

// MARK: - Convenience presentation methods
extension BaseCoordinator {
	func dismissPresentedViewController(completion: CompletionHandler?) {
		navigationController.dismissPresentedViewController(completion: completion)
	}
}

// MARK: - AlertPresentable
extension BaseCoordinator: AlertPresentable {}


// MARK: - dismissPresentedViewController
extension UIViewController {
	func dismissPresentedViewController(completion: CompletionHandler?) {
		guard
			isPresenting,
			let presentedViewController = presentedViewController
		else {
			completion?()
			return
		}

		guard presentedViewController.isPresenting else {
			presentedViewController.dismiss(animated: true, completion: completion)
			return
		}

		presentedViewController.dismissPresentedViewController(completion: completion)
	}
}
