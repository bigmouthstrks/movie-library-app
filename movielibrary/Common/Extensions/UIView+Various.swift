//
//  Extensions.swift
//
//  Created by Benjamin Caceres on 7/23/19.
//  Copyright © 2022 Trust Technologies. All rights reserved.
//

import UIKit

// MARK: - UIVIew Extensionw
extension UIView {
	var defaultAnimationDuration: TimeInterval { 0.3 }

	func hide(animated: Bool = true, completion: CompletionHandler? = nil) {
		guard !isHidden else { return }
		
		guard animated else {
			isHidden = !animated
			completion?()
			return
		}
		
		DispatchQueue.main.async {
			[weak self] in guard let self = self else { return }
			
			UIView.animate(
				withDuration: self.defaultAnimationDuration,
				animations: { self.isHidden = animated }
			) { _ in completion?() }
		}
	}
	
	func show(animated: Bool = true, completion: CompletionHandler? = nil) {
		guard isHidden else { return }
		
		guard animated else {
			isHidden = animated
			completion?()
			return
		}
		
		DispatchQueue.main.async {
			[weak self] in guard let self = self else { return }
			
			UIView.animate(
				withDuration: self.defaultAnimationDuration,
				animations: { self.isHidden = !animated }
			) { _ in completion?() }
		}
	}

	func set(alpha value: CGFloat, animated: Bool = true) {
		guard alpha != value else { return }

		guard animated else {
			alpha = value
			return
		}

		DispatchQueue.main.async {
			[weak self] in guard let self = self else { return }
			UIView.animate(withDuration: self.defaultAnimationDuration) { self.alpha = value }
		}
	}

	func setAsRoundedView() {
		DispatchQueue.main.async {
			self.layer.cornerRadius = self.frame.height / 2
			self.clipsToBounds = true
		}
	}
}

// MARK: - UIViewController Extension
extension UIViewController {
	var screenHeight: CGFloat { UIScreen.main.bounds.height }
	var screenWidth: CGFloat { UIScreen.main.bounds.width }

	func animate(constraintChanges: () -> Void, completion: CompletionHandler? = nil) {
		constraintChanges()

		UIView.animate(
			withDuration: view.defaultAnimationDuration,
			delay: .zero,
			options: .curveEaseIn,
			animations: { self.view.layoutIfNeeded() }
		) { _ in completion?() }
	}
}
