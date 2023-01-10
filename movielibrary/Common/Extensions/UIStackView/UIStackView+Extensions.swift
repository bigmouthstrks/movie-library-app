//
//  UIStackView+Extensions.swift
//

import UIKit

// MARK: - UIStackView
extension UIStackView {
	@discardableResult func with(alignment: Alignment) -> Self {
		with { $0.alignment = alignment }
	}

	@discardableResult func with(axis: NSLayoutConstraint.Axis) -> Self {
		with { $0.axis = axis }
	}

	@discardableResult func with(translatesAutoresizingMask: Bool) -> Self {
		with { $0.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMask }
	}

	@discardableResult func with(distribution: Distribution) -> Self {
		with { $0.distribution = distribution }
	}

	@discardableResult func with(spacing: Double) -> Self {
		with { $0.spacing = spacing }
	}
}
