//
//  ViewLifecycable.swift
//  mitelco-superapp
//
//  Created by Benjamin Caceres on 30-05-20.
//  Copyright © 2022 Trust Technologies. All rights reserved.
//

import Foundation

// MARK: - ViewLifecycable
protocol ViewLifecycleable: AnyObject {
    func onViewDidLoad()
    func onViewWillAppear()
    func onViewWillLayoutSubviews()
    func onViewDidLayoutSubviews()
    func onViewDidAppear()
    func onViewWillDisappear()
	func onLoadView()
}

// MARK: - Default Impl
extension ViewLifecycleable {
    func onViewDidLoad() {}
    func onViewWillAppear() {}
    func onViewWillLayoutSubviews() {}
    func onViewDidLayoutSubviews() {}
    func onViewDidAppear() {}
    func onViewWillDisappear() {}
	func onLoadView() {}
}
