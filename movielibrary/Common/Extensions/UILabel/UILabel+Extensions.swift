//
//  UILabel+Extensions.swift
//

import UIKit

extension UILabel {
	@discardableResult func with(font: UIFont) -> Self {
		with { $0.font = font }
	}

	@discardableResult func with(adjustsFontSizeToFitWidth: Bool) -> Self {
		with { $0.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth }
	}

	@discardableResult func with(numberOfLines: Int) -> Self {
		with { $0.numberOfLines = numberOfLines }
	}

	@discardableResult func with(text: String?) -> Self {
		with { $0.text = text }
	}
	
	@discardableResult func with(textAlignment: NSTextAlignment) -> Self {
		with { $0.textAlignment = textAlignment }
	}
	
	@discardableResult func with(textColor: UIColor) -> Self {
		with { $0.textColor = textColor }
	}
	
	@discardableResult func with(contentMode: ContentMode) -> Self {
		with { $0.contentMode = contentMode }
	}
	
	@discardableResult func with(lineBreakMode: NSLineBreakMode) -> Self {
		with { $0.lineBreakMode = lineBreakMode }
	}
}
