//
//  Navigationable.swift
//  mitelco-superapp
//
//  Created by Benjamin Caceres on 28-03-20.
//  Copyright © 2022 Trust Technologies. All rights reserved.
//

import UIKit

// MARK: - Navigationable
protocol Navigationable: AnyObject {
    var viewController: UIViewController? { get }
    func dismiss(animated: Bool)
    func goBack(animated: Bool)
    func navigateTo(viewController: UIViewController, animated: Bool)
    func present(viewController: UIViewController, animated: Bool, completion: CompletionHandler?)
    func set(viewController: UIViewController, animated: Bool)
    func set(rootViewController: UIViewController)
}

// MARK: - Default implementation
extension Navigationable {
    func dismiss(animated: Bool) {
        guard let nc = viewController?.navigationController else {
            viewController?.dismiss(animated: animated)
            return
        }

        nc.dismiss(animated: animated)
    }

    func goBack(animated: Bool) {
        guard let nc = viewController?.navigationController else {
            viewController?.dismiss(animated: animated)
            return
        }

        guard nc.viewControllers.count > 1 else {
            nc.dismiss(animated: animated)
            return
        }

        nc.popViewController(animated: animated)
    }

    func navigateTo(viewController: UIViewController, animated: Bool) {
        guard let nc = self.viewController?.navigationController else {
            self.viewController?.present(viewController, animated: animated)
            return
        }

        nc.pushViewController(viewController, animated: animated)
    }

    func present(viewController: UIViewController, animated: Bool, completion: CompletionHandler? = nil) {
        guard let nc = self.viewController?.navigationController else {
			self.viewController?.present(viewController: viewController, animated: animated, completion: completion)
            return
        }

		nc.present(viewController: viewController, animated: true, completion: completion)
    }

    func set(viewController: UIViewController, animated: Bool) {
        guard let nc = self.viewController?.navigationController else {
            self.viewController?.present(viewController, animated: animated)
            return
        }

        nc.setViewControllers([viewController], animated: true)
    }
    
    func set(rootViewController: UIViewController) { UIApplication.shared.set(rootViewController: rootViewController) }
}
