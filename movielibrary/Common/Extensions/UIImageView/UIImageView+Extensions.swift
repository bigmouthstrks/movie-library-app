//
//  UIImageView+Extensions.swift
//  mitelco-superapp
//
//  Created by Benjamin Cáceres on 24-06-22.
//

import UIKit

// MARK: - UIImageView
extension UIImageView {
	@discardableResult func with(image: UIImage?) -> Self {
		with { $0.image = image }
	}

	@discardableResult func with(image named: String) -> Self {
		with { $0.with(image: .init(named: named)) }
	}

	@discardableResult func with(contentMode: ContentMode) -> Self {
		with { $0.contentMode = contentMode }
	}
	
	@discardableResult func sizeToFit() -> Self {
		with { $0.sizeToFit() }
	}
}
