//
//  HTTPMethod.swift
//  mitelco-superapp
//
//  Created by Benjamin Cáceres on 07-06-22.
//

import Foundation

// MARK: - HTTPMethod
enum HTTPMethod: String {
	case post = "POST"
	case put = "PUT"
	case get = "GET"
	case delete = "DELETE"
}

// MARK: - EmptyParameters
struct EmptyParameters: Encodable {}
