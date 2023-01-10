//
//  Parameter.swift
//  
//
//  Created by Benjamin Cáceres on 01-08-22.
//

import Foundation

// MARK: - Parameter
protocol Parameter: Encodable & Loopable {}

// MARK: - Parameter
extension Parameter {
	func urlEncode() -> Data {
		var urlEncodedBody = ""
		var values: [String: String] = [:]

		if var props = try? self.allProperties() {
			props.forEach { (key, value) in
				// Unwrap value
				let currentValue: String = value as! String
				
				// Parse key to snake case
				let currentKey: String = key as! String
				let snakeCasedKey: String = currentKey.snakeCased() as! String
				
				values[snakeCasedKey] = currentValue
			}
			
			for (key, value) in values {
				urlEncodedBody.append("\(key)=\(value)&")
			}
		}
		
		return urlEncodedBody.data(using: .utf8)!
	}
}
