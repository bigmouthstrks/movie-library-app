//
//  UIViewController+asd.swift
//  mitelco-superapp
//
//  Created by Benjamin Cáceres on 18-05-22.
//

import UIKit

// MARK: - UIViewController
extension UIViewController {
	func navigationBarHeight() -> CGFloat {
		if self.isNavigationBarBeingDisplayed() && UIApplication.isNotchDevice() {
			return UIApplication.topInsets() + (self.navigationController?.navigationBar.frame.height ?? 0)
		}
		
		if !self.isNavigationBarBeingDisplayed() && UIApplication.isNotchDevice(){
			return UIApplication.topInsets()
		}
		
		if !UIApplication.isNotchDevice() && !self.isNavigationBarBeingDisplayed() {
			return UIApplication.topInsets()
		}
		
		return UIApplication.topInsets()
	}
	
	func isNavigationBarBeingDisplayed() -> Bool {
		if self.navigationController?.navigationBar != nil {
			return true
		}
		return false
	}
	
	func bottomInsets() -> CGFloat {
		return UIApplication.shared.delegate?.window??.safeAreaInsets.bottom ?? 0
	}
}

// MARK: - UIApplication
extension UIApplication {
	static func isNotchDevice() -> Bool {
		if
			let notchInsets = UIApplication.shared.delegate?.window??.safeAreaInsets.top,
			notchInsets >= 44
		{
			return true
		}
		return false
	}
	
	static func topInsets() -> CGFloat {
		guard let topInsets = UIApplication.shared.delegate?.window??.safeAreaInsets.top else {
			return CGFloat(0)
		}
		return topInsets
	}
}

// MARK: - Subviews
extension UIViewController {
	@discardableResult func subviews(_ subviews: UIView...) -> Self {
		with { vc in subviews.forEach { vc.view.addSubview($0) } }
	}
}

// MARK: - Subviews
extension UIView {
	@discardableResult func subviews(_ subviews: UIView...) -> Self {
		with { view in subviews.forEach { view.addSubview($0) } }
	}
}
