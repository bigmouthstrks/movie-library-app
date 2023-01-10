//
//  UICollectionView+Extensions.swift
//  mitelco-superapp
//
//  Created by Benjamin Cáceres on 17-05-22.
//

import UIKit

// MARK: - UICollectionView
extension UICollectionView {
	@discardableResult func with(translatesAutoresizingMask: Bool) -> Self {
		with { $0.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMask }
	}
	
	@discardableResult func with(delegate: UICollectionViewDelegate) -> Self {
		with { $0.delegate = delegate }
	}
	
	@discardableResult func with(dataSource: UICollectionViewDataSource) -> Self {
		with { $0.dataSource = dataSource }
	}
	
	@discardableResult func registerCell(_ type: AnyClass?, identifier: String) -> Self {
		with { $0.register(type, forCellWithReuseIdentifier: identifier) }
	}
}

// MARK: - UICollectionViewFlowLayout
extension UICollectionViewFlowLayout {
	@discardableResult func with(sectionInset: UIEdgeInsets) -> Self {
		with { $0.sectionInset = sectionInset }
	}
	
	@discardableResult func with(itemSize: CGSize) -> Self {
		with { $0.itemSize = itemSize }
	}
	
	@discardableResult func with(scrollDirection: UICollectionView.ScrollDirection) -> Self {
		with { $0.scrollDirection = scrollDirection }
	}
	
}
