//
//  ClientProtocol.swift
//  demonativeclaro
//
//  Created by Benjamin Cáceres on 18-10-22.
//

import Foundation

// MARK: - ClientProtocol
protocol Client: AnyObject {
	func request<T: Decodable>(resource: Router, result: @escaping ResultHandler<T>)
}

// MARK: - ClientProtocol
extension Client {
	func request<T: Decodable>(resource: Router, result: @escaping ResultHandler<T>) {
		HTTPService.request(resource: try! resource.asURLRequest(), result: result)
	}
}
