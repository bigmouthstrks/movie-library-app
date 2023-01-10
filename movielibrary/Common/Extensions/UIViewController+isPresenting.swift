//
//  UIViewController+isPresenting.swift
//  mitelco-superapp
//
//  Created by Benjamin Caceres on 16-08-21.
//

import UIKit

// MARK: - isPresenting
extension UIViewController {
    var isPresenting: Bool { presentedViewController != nil }
}
