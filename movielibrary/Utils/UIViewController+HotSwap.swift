//
//  UIViewController+HotSwap.swift
//  mitelco-superapp
//
//  Created by Benjamin Cáceres on 22-05-22.
//

import UIKit

extension UIViewController {
	#if DEBUG
	@objc func injected() {
		view.setNeedsDisplay()
	}
	#endif
}
