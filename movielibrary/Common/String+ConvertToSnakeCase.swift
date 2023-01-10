//
//  String+ConvertToSnakeCase.swift
//  
//
//  Created by Benjamin Cáceres on 01-08-22.
//

import Foundation

// MARK: - String
extension String {
	func snakeCased() -> String? {
		return self
			.trimmingCharacters(in: .whitespaces)
			.lowercased()
			.replacingOccurrences(of: " ", with: "_")
			.replacingOccurrences(of: ":", with: "")
	}
}
