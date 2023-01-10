//
//  JSONParameterEncoder.swift
//
//  Created by Benjamin Cáceres on 15-02-22.
//

import Foundation

// MARK: - ParameterEncoder
protocol ParameterEncoder {
    func encode<Parameters: Parameter>(parameters: Parameters?, into: URLRequest) throws -> URLRequest
}

// MARK: - JSONParameterEncoder
class JSONParameterEncoder: ParameterEncoder {
    public let encoder: JSONEncoder

    public init(encoder: JSONEncoder = JSONEncoder()) {
        self.encoder = encoder
    }
    
    func encode<Parameters: Parameter>(parameters: Parameters?, into request: URLRequest) throws -> URLRequest {
        guard let parameters = parameters else { return request }

        var request = request

        do {
            let data = try encoder.encode(parameters)
			let body = String(data: data, encoding: .utf8)
			request.httpBody = body?.replacingOccurrences(of: "\\/\\/", with: "//").data(using: .utf8)
			
            if request.allHTTPHeaderFields?["Content-Type"] == nil {
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
			Logger.log("Error encoding parameters.")
        }
        
        return request
    }
}

// MARK: - URLParameterEncoder
class URLParameterEncoder: ParameterEncoder {
	func encode<Parameters: Parameter>(parameters: Parameters?, into request: URLRequest) throws -> URLRequest {
		guard let parameters = parameters else { return request }
		
		var request = request
		
		do {
			var urlEncodedBody: String = .empty
			var values: [String: String] = [:]

			if var props = try? parameters.allProperties() {
				props.forEach { (key, value) in
					let currentValue: String = value as! String
					let currentKey: String = key as! String
					let snakeCasedKey: String = currentKey.snakeCased() as! String
					
					values[snakeCasedKey] = currentValue
				}
				
				for (key, value) in values {
					urlEncodedBody.append("\(key)=\(value)&")
				}
			}
				
			request.httpBody = urlEncodedBody.data(using: .utf8)!
		} catch {
			Logger.log("Error encoding parameters.")
		}
		
		return request
	}
}
