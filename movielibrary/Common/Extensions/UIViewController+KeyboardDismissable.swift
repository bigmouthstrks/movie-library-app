//
//  UIViewController+KeyboardDismissable.swift
//
//  Created by Benjamin Caceres on 08-07-20.
//  Copyright © 2022 Trust Technologies. All rights reserved.
//

import UIKit

// MARK: - KeyboardDismissable
extension UIViewController: KeyboardDismissable {
    @objc func dismissKeyboard() { view.endEditing(true) }
}
