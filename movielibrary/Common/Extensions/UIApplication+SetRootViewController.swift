//
//  UIApplication+SetRootViewController.swift
//  mitelco-superapp
//
//  Created by Benjamin Caceres on 19-04-20.
//  Copyright © 2022 Trust Technologies. All rights reserved.
//

import UIKit

// MARK: - setRootViewController
extension UIApplication {
    func set(rootViewController: UIViewController?) {
        keyWindowInConnectedScenes?.rootViewController = rootViewController
        keyWindowInConnectedScenes?.makeKeyAndVisible()
    }
}
