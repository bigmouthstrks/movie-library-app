//
//  UIViewController+dismissPresentedVC.swift
//  mitelco-superapp
//
//  Created by Benjamin Caceres on 16-08-21.
//

import UIKit

// MARK: - dismissPresentedVC
extension UIViewController {
    func dismissPresentedVC(completion: CompletionHandler?) {
        guard
            isPresenting,
            let presentedViewController = presentedViewController else {
            completion?()
            return
        }

        guard presentedViewController.isPresenting else {
            print("\ndismissing: \(presentedViewController)")
            presentedViewController.dismiss(animated: true, completion: completion)
            return
        }

        presentedViewController.dismissPresentedVC(completion: completion)
    }
}
