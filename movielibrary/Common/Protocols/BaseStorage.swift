//
//  BaseStorage.swift
//  demonativeclaro
//
//  Created by Benjamin Cáceres on 09-11-22.
//

import Foundation

// MARK: - BaseStorage
protocol BaseStorage {
	var storage: KeychainWrapper { get }
}

// MARK: - BaseStorage
extension BaseStorage {
	var storage: KeychainWrapper {
		return KeychainWrapper.standard
	}
}
