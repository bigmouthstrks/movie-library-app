//
//  CollectionViewSizeable.swift
//

// MARK: - CollectionViewSizeable
protocol CollectionViewSizeable: AnyObject {
    func onInsets(for section: Int) -> (top: Double, bottom: Double, left: Double, right: Double)
    func onSizeForHeaderItem(in section: Int) -> (width: Double, height: Double)
    func onSizeForItem(in section: Int, at index: Int) -> (width: Double, height: Double)
}

// MARK: - Default Implementation
extension CollectionViewSizeable {
    func onInsets(for section: Int) -> (top: Double, bottom: Double, left: Double, right: Double) { (.zero, .zero, .zero, .zero) }
    func onSizeForHeaderItem(in section: Int) -> (width: Double, height: Double) { (.zero, .zero) }
}
