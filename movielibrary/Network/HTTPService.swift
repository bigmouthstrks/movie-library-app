//
//  HTTPService.swift
//  
//
//  Created by Benjamin Cáceres on 01-03-22.
//

import Foundation

// MARK: - HTTPService
enum HTTPService {
	static func request<T: Decodable>(resource: URLRequest, result: @escaping ResultHandler<T>, retry: Bool = false) {
		URLSession.shared.dataTask(with: resource) {
			(data, response, error) in
			
			guard let data = data else { result(.failure(AppError(code: 404, localizedDescription: "Not Found"))); return }
		
			handle(response, with: result)
			Logger.networkRequestStatus(with: resource, parameters: data, response: response)
			
			do {
				let jsonDecoder = JSONDecoder()
				jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
				let response = try jsonDecoder.decode(T.self, from: data)
				
				result(.success(response))
			} catch {
				result(.failure(AppError(code: 400, localizedDescription: "Error decoding JSON")))
			}
		}.resume()
	}
}

// MARK: - HTTPService
extension HTTPService {
	static func handle<T>(_ response: URLResponse?, with result: @escaping ResultHandler<T>) {
		let httpResponse = response as? HTTPURLResponse
		guard let statusCode = httpResponse?.statusCode else { return }
		
		let error = AppError(code: statusCode, localizedDescription: "Unknown Error")
		
		if (200...299).contains(statusCode) {
			return
		} else {
			result(.failure(error))
		}
	}
}
