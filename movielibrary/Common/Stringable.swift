//
//  Stringable.swift
//

// MARK: - Stringable
protocol Stringable {
	var asString: String { get }
}

// MARK: - where Self: RawRepresentable, RawValue == String
extension Stringable where Self: RawRepresentable, RawValue == String {
	var asString: String { rawValue }
}
