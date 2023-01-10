//
//  Withable.swift
//

import Foundation

// MARK: - Withable for Objects
protocol ObjectWithable: AnyObject {
    associatedtype T
    
    /// Provides a closure to configure instances inline.
    /// - Parameter closure: A closure `self` as the argument.
    /// - Returns: Simply returns the instance after called the `closure`.
    @discardableResult func with(_ closure: (_ instance: T) -> Void) -> T
}

extension ObjectWithable {
    @discardableResult func with(_ closure: (_ instance: Self) -> Void) -> Self {
        closure(self)
        return self
    }
}

extension NSObject: ObjectWithable {}


// MARK: - Withable for Values
protocol Withable {
    associatedtype T
    
    /// Provides a closure to configure instances inline.
    /// - Parameter closure: A closure with a mutable copy of `self` as the argument.
    /// - Returns: Simply returns the mutated copy of the instance after called the `closure`.
    @discardableResult func with(_ closure: (_ instance: inout T) -> Void) -> T
}

extension Withable {
    @discardableResult func with(_ closure: (_ instance: inout Self) -> Void) -> Self {
        var copy = self
        closure(&copy)
        return copy
    }
}
