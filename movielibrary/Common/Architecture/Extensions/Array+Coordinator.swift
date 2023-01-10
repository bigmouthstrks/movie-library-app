//
//  Array+Coordinator.swift
//  Identidad Digital
//
//  Created by Benjamin Caceres on 16-07-21.
//

// MARK: - Array convenience Extension
extension Array where Element == Coordinator {
    func getFirst<T: Coordinator>(of type: T.Type) -> T? {
        first { $0 is T } as? T
    }

    mutating func removeAll<T: Coordinator>(of type: T.Type) {
        guard getFirst(of: T.self) != nil else { return }
        removeAll { $0 is T }
    }
}
