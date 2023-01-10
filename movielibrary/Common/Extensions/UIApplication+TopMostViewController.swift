//
//  UIApplication+TopMostViewController.swift
//  mitelco-superapp
//
//  Created by Benjamin Caceres on 19-04-20.
//  Copyright © 2022 Trust Technologies. All rights reserved.
//

import UIKit

// MARK: - topMostViewController
extension UIApplication {
	func topMostViewController() -> UIViewController? { keyWindowInConnectedScenes?.rootViewController?.topMostViewController() }
}
