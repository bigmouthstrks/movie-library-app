//
//  Loopable.swift
//  
//
//  Created by Benjamin Cáceres on 28-07-22.
//

import Foundation

// MARK: - Loopable
protocol Loopable {
	func allProperties() throws -> [String: Any]
}

// MARK: - Loopable allProperties()
extension Loopable {
	func allProperties() throws -> [String: Any] {
		var result: [String: Any] = [:]
		let mirror = Mirror(reflecting: self)
		
		guard let style = mirror.displayStyle, style == .struct || style == .class else { throw NSError() }
		
		for (property, value) in mirror.children {
			guard let property = property else { continue }
			result[property] = value
		}

		return result
	}
}
