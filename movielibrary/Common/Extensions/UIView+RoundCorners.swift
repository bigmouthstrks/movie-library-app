//
//  UIView+RoundCorners.swift
//  mitelco-superapp
//
//  Created by Benjamin Caceres on 09-06-20.
//  Copyright © 2022 Trust Technologies. All rights reserved.
//

import UIKit

// MARK: - UIView+RoundCorners
extension UIView {
    func round(corners: CACornerMask, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.maskedCorners = corners
    }
}
