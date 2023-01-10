//
//  String+GetQueryItems.swift
//  demonativeclaro
//
//  Created by Benjamin Cáceres on 04-01-23.
//

import Foundation

// MARK: - String
extension String {
	func getQueryItems() -> [String : String] {
		var queryItems: [String : String] = [:]
		let components: NSURLComponents? = getURLComonents(self)
		for item in components?.queryItems ?? [] {
			queryItems[item.name] = item.value?.removingPercentEncoding
		}
		return queryItems
	}
	
	func getURLComonents(_ urlString: String?) -> NSURLComponents? {
		var components: NSURLComponents? = nil
		let linkUrl = URL(string: urlString?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? "")
		if let linkUrl = linkUrl {
			components = NSURLComponents(url: linkUrl, resolvingAgainstBaseURL: true)
		}
		return components
	}
}
