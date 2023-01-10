//
//  Credentials.swift
//  demonativeclaro
//
//  Created by Benjamin Cáceres on 09-11-22.
//

import Foundation

// MARK: - Credentials
protocol Credentials: Codable {
	var tokenType: String { set get }
	var accessToken: String { set get }
}
