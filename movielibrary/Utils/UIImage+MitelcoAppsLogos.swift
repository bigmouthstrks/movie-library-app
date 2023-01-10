//
//  UIImage+MitelcoAppsLogos.swift
//  mitelco-superapp
//
//  Created by Benjamin Cáceres on 11-05-22.
//

import UIKit

// MARK: - Images
extension UIImage {
	// MARK: - Icons
	enum Icons {
		static let arrowDown = UIImage(systemName: "chevron.down")!
		static let arrowBackwards = UIImage(systemName: "arrow.backward")!
		static let personFilled = UIImage(systemName: "person.circle.fill")!
		static let touchId = UIImage(systemName: "touchid")!
		static let server = UIImage(systemName: "server.rack")!
		static let portraitArrowRight = UIImage(systemName: "rectangle.portrait.and.arrow.right")!

		static let arrowForward = UIImage(named: "arrow_forward")!
		static let toggableArrowForward = UIImage(systemName: "arrowtriangle.right.fill")!
		static let toggableArrowDown = UIImage(systemName: "arrowtriangle.down.fill")!
		static let purpleClipboard = UIImage(named: "clipboard_purple")!
		static let grayClipboard = UIImage(named: "clipboard_gray")!
		static let profile = UIImage(named: "profile")!
		static let authorizationTab = UIImage(named: "authorization")!
		static let activityTab = UIImage(named: "activity")!
		static let profileTab = UIImage(named: "profile_tab")!
		static let warning = UIImage(named: "warning")!
		static let error = UIImage(named: "error")!
		static let emptyAuthorization = UIImage(named: "empty_transaction")!
		static let tradeArrows = UIImage(named: "trade_arrows")!
		static let grabber = UIImage(named: "grabber")!
		
		static let clipboard = UIImage(systemName: "doc.on.clipboard")!
	}
	
	// MARK: - Images
	enum Images {
		static let transactionDetailHeader = UIImage(named: "transaction_header_example")!
		static let profileImage = UIImage(named: "profile")
		static let trustLogoImage = UIImage(named: "trust")
	}
}
