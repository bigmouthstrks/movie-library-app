//
//  ViewModelable.swift
//

import UIKit

// MARK: - ViewModelable
protocol ViewModelable: AnyObject {
    associatedtype ViewModel
    var viewModel: ViewModel? { get set }
    func set(viewModel: ViewModel)
}

// MARK: - Default Implementation
extension ViewModelable {
    func set(viewModel: ViewModel) { self.viewModel = viewModel }
}

// MARK: - UIViewModelable
typealias UIViewModelable = BaseView & ViewModelable
