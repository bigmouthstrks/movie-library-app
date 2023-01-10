//
//  ActivityIndicatorable.swift
//
//  Created by Benjamin Caceres on 30-05-20.
//  Copyright © 2022 Trust Technologies. All rights reserved.
//
import UIKit

// MARK: - ActivityIndicatorable
protocol ActivityIndicatorable: AnyObject {
	func startActivityIndicator()
	func stopActivityIndicator()
}

// MARK: - ActivityIndicatorable
extension ActivityIndicatorable where Self: UIViewController {
	func startActivityIndicator() {
		self.view.subviews.forEach { view in
			view.isUserInteractionEnabled = false
		}
		
		let activityIndicator = UIActivityIndicatorView()
		
		activityIndicator.sizeToFit()
		activityIndicator.color = .coldNeutral1
		activityIndicator.center = view.center
		
		activityIndicator.frame = CGRect(x: self.view.frame.size.width/2 - 75/2, y: self.view.frame.size.height/2 - 75/2, width: 75, height: 75)
		activityIndicator.backgroundColor = .toastView
		activityIndicator.layer.cornerRadius = .defaultCornerRadius
		
		self.view.addSubview(activityIndicator)
		
		activityIndicator.startAnimating()
	}

	func stopActivityIndicator() {
		DispatchQueue.main.async {
			self.view.subviews.filter { $0 is UIActivityIndicatorView }.forEach {
				$0.removeFromSuperview()
			}
		
			self.view.subviews.forEach { view in
				view.isUserInteractionEnabled = true
			}
			
		}
	}
}
