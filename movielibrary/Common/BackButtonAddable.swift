//
//  BackButtonAddable.swift
//  mitelco-superapp
//
//  Created by Benjamin Caceres on 31-05-21.
//

import UIKit

// MARK: - BackButtonValues
private enum BackButtonValues {
    static var icon: UIImage? { UIImage(named: "roundWhiteLeftArrowIcon") }
    static var size: CGSize { CGSize(width: 44, height: 44) }
}

// MARK: - BackButtonAddable
protocol BackButtonAddable {
    func addBackButton(with target: Any?, action: Selector)
}

// MARK: - BackButtonAddable where Self: UIViewController
extension BackButtonAddable where Self: UIViewController {
    func addBackButton(with target: Any?, action: Selector) {
        let icon = BackButtonValues.icon
        let size = BackButtonValues.size
        
        let button = UIButton(type: .custom)
        button.addTarget(target, action: action, for: .touchUpInside)
        button.frame.size = size
        button.setImage(icon, for: .normal)

        let leftBarButtonItem = UIBarButtonItem(customView: button)
        leftBarButtonItem.customView?.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        leftBarButtonItem.customView?.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        navigationItem.setLeftBarButton(leftBarButtonItem, animated: false)
    }
}
