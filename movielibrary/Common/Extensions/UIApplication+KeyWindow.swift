//
//  UIApplication+KeyWindow.swift
//  mitelco-superapp
//
//  Created by Benjamin Caceres on 19-04-20.
//  Copyright © 2022 Trust Technologies. All rights reserved.
//

import UIKit

// MARK: - KeyWindow
extension UIApplication {
	var keyWindowInConnectedScenes: UIWindow? { windows.first { $0.isKeyWindow } }
}
