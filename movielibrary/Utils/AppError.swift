//
//  AppError.swift
//  movielibrary
//
//  Created by Benjamin Cáceres on 16-03-22.
//

// MARK: - AppError
struct AppError: Error {
	init(code: Int, localizedDescription: String) {
		self.code = code
		self.localizedDescription = localizedDescription
	}
	
	var code: Int
	var localizedDescription: String
}
