//
//  CollectionViewDataSourceable.swift
//

// MARK: - CollectionViewDataSourceable
protocol CollectionViewDataSourceable: AnyObject {
    func getNumberOfSections() -> Int
    func getNumberOfItems(in section: Int) -> Int
    func onHeaderItemDataSourceRequested(in section: Int) -> DataSource?
    func onCellForItem(in section: Int, at index: Int) -> DataSource?
    func onHeaderItemReuseIdentifierRequested() -> String
    func onReuseIdentifierRequested(in section: Int, at index: Int) -> String
}

// MARK: - Default Implementation
extension CollectionViewDataSourceable {
    func getNumberOfSections() -> Int { 1 }
    func onHeaderItemDataSourceRequested(in section: Int) -> DataSource? { nil }
    func onHeaderItemReuseIdentifierRequested() -> String { .empty }
}
