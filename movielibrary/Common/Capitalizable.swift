//
//  Capitalizable.swift
//

// MARK: - Capitalizable
protocol Capitalizable {
	var capitalized: String { get }
}

// MARK: - where Self: RawRepresentable, RawValue == String
extension Capitalizable where Self: RawRepresentable, RawValue == String {
	var capitalized: String { rawValue.capitalized }
}

// MARK: - where Self: RawRepresentable & Stringable, RawValue == String
extension Capitalizable where Self: RawRepresentable & Stringable, RawValue == String {
	var capitalized: String { asString.capitalized }
}
