//
//  BaseCoordinatorParent.swift
//
//  Created by Benjamin Caceres on 14-07-20.
//  Copyright © 2022 Trust Technologies. All rights reserved.
//

// MARK: - BaseCoordinatorParent
protocol BaseCoordinatorParent: AnyObject {
    func onProcessDone<T>(by coordinator: T) where T: Coordinator
}
