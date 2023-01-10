//
//  CodableStorage.swift
//  demonativeclaro
//
//  Created by Benjamin Cáceres on 09-11-22.
//

import Foundation

// MARK: - CodableStorage
protocol CodableStorage: BaseStorage{
	var encoder: JSONEncoder { get }
	var decoder: JSONDecoder { get }
	
	func save(_ object: Encodable, key: String)
	func append<T: Codable>(_ object: T, key: String)
	func get<T: Decodable>(key: String) -> T?
	func getArray<T: Codable>(key: String) -> [T]?
}

// MARK: - CodableStorage
extension CodableStorage {
	var encoder: JSONEncoder { return JSONEncoder() }
	var decoder: JSONDecoder { return JSONDecoder() }
	
	func save(_ object: Encodable, key: String) {
		do {
			let data = try encoder.encode(object)
			storage.set(data, forKey: key)
		} catch let error {
			Logger.log(error.localizedDescription)
		}
	}
	
	func append<T: Codable>(_ object: T, key: String) {
		do {
			var objectsArray: [T]?
			
			if let arrayData = storage.data(forKey: key) {
				objectsArray = try decoder.decode([T].self, from: arrayData)
				objectsArray?.append(object)
			} else {
				objectsArray = []
			}
			
			let data = try encoder.encode(objectsArray)
			storage.set(data, forKey: key)
		} catch let error {
			Logger.log(error.localizedDescription)
		}
	}
	
	func getArray<T: Codable>(key: String) -> [T]? {
		do {
			guard let data = storage.data(forKey: key) else { return [] }
			let array = try decoder.decode([T].self, from: data)
			
			return array
		} catch let error {
			Logger.log(error.localizedDescription)
		}
		
		return []
	}
	
	func get<T: Decodable>(key: String) -> T? {
		do {
			let data = storage.data(forKey: key) ?? Data()
			let object = try decoder.decode(T.self, from: data)
			
			return object
		} catch let error {
			Logger.log(error.localizedDescription)
		}
		
		return nil
	}
}
