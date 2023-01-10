//
//  DataSourceable.swift
//  mitelco-superapp
//
//  Created by Benjamin Cáceres on 16-05-22.
//

import Foundation

// MARK: - DataSourceable
protocol DataSourceable: AnyObject {
	var dataSource: DataSource? { get set }
	func set(dataSource: DataSource)
}

// MARK: - Default Implementation
extension DataSourceable {
	func set(dataSource: DataSource) { self.dataSource = dataSource }
}

// MARK: - DataSource
protocol DataSource {}
