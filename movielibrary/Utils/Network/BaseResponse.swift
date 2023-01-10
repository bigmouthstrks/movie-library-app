//
//  File.swift
//  mitelco-superapp
//
//  Created by Benjamin Cáceres on 07-06-22.
//

import Foundation

// MARK: - BaseResponse
struct BaseResponse<T: Decodable>: Decodable {
	var code: Int?
	var resource: String?
	var message: String?
	var data: T?
	var error: String?
}
