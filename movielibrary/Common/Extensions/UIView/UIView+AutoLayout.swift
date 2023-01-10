//
//  UIView+AutoLayout.swift
//  mitelco-superapp
//
//  Created by Benjamin Cáceres on 10-06-22.
//

import UIKit

// MARK: - AutoLayout Helpers
extension UIView {
	func alignCenter(with view: UIView) {
		alignCenterX(with: view)
		alignCenterY(with: view)
	}

	func pin(to layoutGuide: UILayoutGuide, insets: UIEdgeInsets = .zero) {
		translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate(
			[
				topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: insets.top),
				bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -insets.bottom),
				leadingAnchor.constraint(equalTo: layoutGuide.leftAnchor, constant: insets.left),
				trailingAnchor.constraint(equalTo: layoutGuide.rightAnchor, constant: -insets.right)
			]
		)
	}

	func pin(to view: UIView, insets: UIEdgeInsets = .zero) {
		translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate(
			[
				topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
				bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom),
				leftAnchor.constraint(equalTo: view.leftAnchor, constant: insets.left),
				rightAnchor.constraint(equalTo: view.rightAnchor, constant: -insets.right)
			]
		)
	}

	@discardableResult func alignTop(with view: UIView, inset: CGFloat = .zero) -> NSLayoutConstraint {
		translatesAutoresizingMaskIntoConstraints = false
		return topAnchor.constraint(equalTo: view.topAnchor, constant: inset).with { $0.isActive = true }
	}

	@discardableResult func pinTop(to anchor: NSLayoutYAxisAnchor, inset: CGFloat = .zero) -> NSLayoutConstraint {
		translatesAutoresizingMaskIntoConstraints = false
		return topAnchor.constraint(equalTo: anchor, constant: inset).with { $0.isActive = true }
	}
	
	@discardableResult func alignBottom(with view: UIView, inset: CGFloat = .zero) -> NSLayoutConstraint {
		translatesAutoresizingMaskIntoConstraints = false
		return bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -inset).with { $0.isActive = true }
	}

	@discardableResult func pinBottom(to anchor: NSLayoutYAxisAnchor, inset: CGFloat = .zero) -> NSLayoutConstraint {
		translatesAutoresizingMaskIntoConstraints = false
		return bottomAnchor.constraint(equalTo: anchor, constant: -inset).with { $0.isActive = true }
	}
	
	@discardableResult func alignLeading(with view: UIView, inset: CGFloat = .zero) -> NSLayoutConstraint {
		translatesAutoresizingMaskIntoConstraints = false
		return leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset).with { $0.isActive = true }
	}
	
	@discardableResult func pinLeading(to anchor: NSLayoutXAxisAnchor, inset: CGFloat = 0) -> NSLayoutConstraint {
		translatesAutoresizingMaskIntoConstraints = false
		return leadingAnchor.constraint(equalTo: anchor, constant: inset).with { $0.isActive = true }
	}
	
	@discardableResult func alignTrailing(with view: UIView, inset: CGFloat = .zero) -> NSLayoutConstraint {
		translatesAutoresizingMaskIntoConstraints = false
		return trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset).with { $0.isActive = true }
	}

	@discardableResult func pinTrailing(to anchor: NSLayoutXAxisAnchor, inset: CGFloat = .zero) -> NSLayoutConstraint {
		translatesAutoresizingMaskIntoConstraints = false
		return trailingAnchor.constraint(equalTo: anchor, constant: -inset).with { $0.isActive = true }
	}

	@discardableResult func alignCenterX(with view: UIView, inset: CGFloat = .zero) -> NSLayoutConstraint {
		translatesAutoresizingMaskIntoConstraints = false
		return centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: inset).with { $0.isActive = true }
	}

	@discardableResult func alignCenterY(with view: UIView, inset: CGFloat = .zero) -> NSLayoutConstraint {
		translatesAutoresizingMaskIntoConstraints = false
		return centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: inset).with { $0.isActive = true }
	}

	@discardableResult func set(height: CGFloat) -> NSLayoutConstraint {
		translatesAutoresizingMaskIntoConstraints = false
		return heightAnchor.constraint(equalToConstant: height).with { $0.isActive = true }
	}

	@discardableResult func set(width: CGFloat) -> NSLayoutConstraint {
		translatesAutoresizingMaskIntoConstraints = false
		return widthAnchor.constraint(equalToConstant: width).with { $0.isActive = true }
	}

	@discardableResult func contentHugging(priority: UILayoutPriority, axis: NSLayoutConstraint.Axis) -> Self {
		with { $0.setContentHuggingPriority(priority, for: axis) }
	}

	@discardableResult func contentCompressionResistance(priority: UILayoutPriority, axis: NSLayoutConstraint.Axis) -> Self {
		with { $0.setContentCompressionResistancePriority(priority, for: axis) }
	}
}

// MARK: - onMoveToSuperview
public extension UIView {
	typealias ViewAction = (_ view: UIView) -> Void
	typealias ViewAndSuperviewAction = (_ view: UIView, _ superview: UIView) -> Void

	/// The `onMoveToSuperview` closure will be called once, right after this view called its
	/// `didMoveToSuperView()`. Suitable place to add constraints to this view instance.
	/// See https://developer.apple.com/documentation/uikit/uiview/1622512-updateconstraints
	@discardableResult func onMoveToSuperview(_ onMoveToSuperview: @escaping ViewAction) -> Self {
		self.onMoveToSuperview = onMoveToSuperview
		return self
	}
	
	@discardableResult func onMoveToSuperview(_ onMoveToSuperview: @escaping ViewAndSuperviewAction) -> Self {
		self.onMoveToSuperview = { _ in
			guard let superview = self.superview else { return }
			onMoveToSuperview(self, superview)
		}
		return self
	}
}

// MARK: - Swizzle
extension UIView {
	static var notSwizzled = true

	struct Keys {
		static var viewAction: UInt8 = .zero
	}
	
	/// The `onMoveToSuperview` closure will be called once, right after this view called its
	/// `didMoveToSuperView()`. Suitable place to add constraints to this view instance.
	/// See https://developer.apple.com/documentation/uikit/uiview/1622512-updateconstraints
	var onMoveToSuperview: ViewAction? {
		get {
			objc_getAssociatedObject(self, &Keys.viewAction) as? ViewAction
		}
		set {
			swizzleIfNeeded()
			objc_setAssociatedObject(self, &Keys.viewAction, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
		}
	}

	@objc func originalDidMoveToSuperview() {
		// Original implementation will be copied here.
	}

	@objc func swizzledDidMoveToSuperview() {
		originalDidMoveToSuperview()
		if superview != nil {
			onMoveToSuperview?(self)
			onMoveToSuperview = nil
		}
	}

	func swizzleIfNeeded() {
		guard Self.notSwizzled else { return }

		guard let viewClass: AnyClass = object_getClass(self) else {
			return print("Could not get `UIView` class.")
		}

		let selector = #selector(didMoveToSuperview)
		guard let method = class_getInstanceMethod(viewClass, selector) else {
			return print("Could not get `didMoveToSuperview()` selector.")
		}

		let originalSelector = #selector(originalDidMoveToSuperview)
		guard let originalMethod = class_getInstanceMethod(viewClass, originalSelector) else {
			return print("Could not get original `originalDidMoveToSuperview()` selector.")
		}

		let swizzledSelector = #selector(swizzledDidMoveToSuperview)
		guard let swizzledMethod = class_getInstanceMethod(viewClass, swizzledSelector) else {
			return print("Could not get swizzled `swizzledDidMoveToSuperview()` selector.")
		}

		// Swap implementations.
		method_exchangeImplementations(method, originalMethod)
		method_exchangeImplementations(method, swizzledMethod)

		// Flag.
		Self.notSwizzled = false
	}
}
