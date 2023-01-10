//
//  Router.swift
//
//  Created by Benjamin Cáceres on 15-02-22.
//

import Foundation

// MARK: - Router
enum Router {
	case getMovies
		
	// MARK: - BaseURL
	var baseURL: URL {
		switch self {
		case .getMovies: return URL(string: "www.google.cl")!
		}
	}
	
	// MARK: - Service
	var service: String {
		switch self {
		case .getMovies: return "/transaction-context/api/v1"
		}
	}
	
	// MARK: - Path
	var path: String {
		switch self {
		case .getMovies: return "/products"
		}
	}
	
	// MARK: - URL
	var url: URL {
		switch self {
		case .getMovies: return baseURL.appendingPathComponent("\(service)\(path)")
		}
	}
	
	// MARK: - HTTPMethod
	var method: HTTPMethod {
		switch self {
		case .getMovies: return .get
		}
	}
	
	// MARK: - Parameters
	var parameters: Encodable {
		switch self {
		default: return EmptyParameters()
		}
	}
	
	// MARK: - AsURLRequest Method
	func asURLRequest() throws -> URLRequest {
		let keychainWrapper = KeychainWrapper(serviceName: .AppCredentials.serviceName, accessGroup: .AppCredentials.accessGroup)

		var urlRequest = URLRequest(url: url)
		
		// MARK: - UserAgent Header
		urlRequest.setValue(.userAgent, forHTTPHeaderField: "User-Agent")
				
		// MARK: - HTTPMethod
		urlRequest.httpMethod = method.rawValue
		
		// MARK: - URL Parameters Encoding
		let urlEncoder: URLParameterEncoder = URLParameterEncoder()
		
		// MARK: - Parameters Encoding
		var jsonEncoder: JSONParameterEncoder {
			let jsonEncoder = JSONEncoder()
			jsonEncoder.keyEncodingStrategy = .convertToSnakeCase
			return .init(encoder: jsonEncoder)
		}
		
		// MARK: - Authorization
		switch self {
		case .getMovies:
			return urlRequest
		}
		
		// MARK: - Parameters Encoding
		switch self {
		default: return urlRequest
		}
	}
}
