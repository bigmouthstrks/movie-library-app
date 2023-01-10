//
//  Logger.swift
//  
//
//  Created by Benjamin Cáceres on 23-03-22.
//

import Foundation

// MARK: - Logger
enum Logger {
	private static var currentTime: String {
		let date = Date()
		let df = DateFormatter()
		df.dateFormat = "HH:mm"
		return df.string(from: date)
	}
	
	static func log(_ object: Any) {
		print("________________________________ 🎯 TRUST SSO  ________________________________")
		print("| 🔸 \(Logger.currentTime): \(object)")
		print("_______________________________________________________________________________")
	}
	
	static func networkRequestStatus(with resource: URLRequest, parameters: Data, response: URLResponse?) {
		let httpResponse = response as? HTTPURLResponse
		guard let statusCode = httpResponse?.statusCode else { return }
		
		let dataString = String(data: parameters, encoding: .utf8)
		let url = resource.url!
		let httpMethod = resource.httpMethod!
		
		let httpBody = resource.httpBody
		var body = String(data: httpBody ?? Data(), encoding: .utf8)
		if body == .empty { body = "Empty body" }
		
		let headers = resource.allHTTPHeaderFields
		let headersString: String = headers!.isEmpty ? "Empty headers" : "\(headers ?? [:])"

		print("________________________________ 🎯 TRUST SSO  ________________________________")
		print("| 🔸 URL      : \(url)")
		print("| 🔸 HEADERS  : \(headersString)")
		print("| 🔸 BODY     : \(body!)")
		print("| 🔸 CODE     : \(statusCode)")
		print("| 🔸 RESPONSE : \(dataString ?? .empty)")
		print("| 🔸 METHOD   : \(httpMethod)")
		print("________________________________  \(Logger.currentTime)  ________________________________")
	}
}
