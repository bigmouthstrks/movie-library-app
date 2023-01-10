//
//  String+UserAgent.swift
//  mitelco-superapp
//
//  Created by Benjamin Cáceres on 07-07-22.
//

import Foundation

// MARK: - userAgent
extension String {
	static var userAgent: String {
		let appPlatform = "ios"
		let appBundleId = Bundle.main.bundleIdentifier
		let appBuildNumber = Bundle.main.infoDictionary!["CFBundleVersion"] as! String
		let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
		
		return "\(appBundleId ?? .empty) \(appPlatform)/v\(appVersion)c\(appBuildNumber)"
	}
}
