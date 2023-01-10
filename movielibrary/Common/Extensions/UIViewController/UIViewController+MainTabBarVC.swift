//
//  UIViewController+MainTabBarVC.swift
//  mitelco-superapp
//
//  Created by Benjamin Cáceres on 24-06-22.
//

import UIKit

// MARK: - UIViewController Extension
extension UIViewController {
	var mainTabBarController: MainTabBarController? { closestParentViewController(class: MainTabBarController.self) as? MainTabBarController }
}

// MARK: - MainTabBarDelegate
protocol MainTabBarDelegate: AnyObject {}

// MARK: - Tabs
enum Tabs: Int {
	case authorization = 0
	case activity
	case profile
}

// MARK: - MainTabBarController
final class MainTabBarController: UITabBarController {
	private let tabBarItems: [UITabBarItem] = []
	
	lazy var bottomTabBar = UITabBar()
		.with {
			$0.delegate = self
			$0.items = tabBarItems
			$0.unselectedItemTintColor = .darkGray
			$0.tintColor = .dark
			$0.itemPositioning = .centered
			$0.backgroundColor = .tabBar
			$0.itemSpacing = 100
			$0.selectedItem?.badgeColor = .blue
		}
		.onMoveToSuperview {
			$0.pinBottom(to: self.view.bottomAnchor)
			$0.pinLeading(to: self.view.leadingAnchor)
			$0.pinTrailing(to: self.view.trailingAnchor)
		}
	
	private var moduleDelegate: MainTabBarDelegate
	var isStillAnimatingTransition = false
	
	init(delegate: MainTabBarDelegate) {
		self.moduleDelegate = delegate
		super.init(nibName: nil, bundle: nil)
	}

	@available(*, unavailable)
	required init?(coder: NSCoder) {
		fatalError("NSCoder is not supported")
	}
}

// MARK: - UINavigationBarDelegate
extension MainTabBarController: UINavigationBarDelegate {
	override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
		guard !isStillAnimatingTransition, selectedIndex != item.tag else {
			guard let nc = viewControllers?[selectedIndex] as? UINavigationController else { return }
			nc.popViewController(animated: true)
			return
		}
		
		selectedIndex = item.tag
	}
}

// MARK: - MainTabBarCoordinator
extension MainTabBarController {
	override func viewDidLoad() {
		super.viewDidLoad()
		subviews(bottomTabBar)
		setupAppearance()
	}
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()

		bottomTabBar.with {
			let height = $0.sizeThatFits(view.bounds.size).height
			let offset = view.safeAreaInsets.bottom
			$0.set(height: height + offset)
		}
	}
}

// MARK: - Convenience
extension MainTabBarController {
	private var shouldUseAltTabBarItems: Bool { viewControllers?.count ?? .zero > tabBarItems.count }

	private var selectedTab: Tabs {
		switch selectedIndex {
		case 0: return .authorization
		case 1: return .activity
		case 2: return .profile
		default: return .authorization
		}
	}
}

// MARK: - MainTabBarController
extension MainTabBarController {
	func setupAppearance() {
		let appearance = UITabBarItem.appearance()
		let attributes = [NSAttributedString.Key.font: UIFont.title]
		appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
		
		UITabBar.appearance().shadowImage = UIImage()
		UITabBar.appearance().backgroundImage = UIImage()
	}
}

// MARK: - ActivityIndicatorable
extension MainTabBarController: ActivityIndicatorable {}

// MARK: - NavigationBarVisibilityTogglable
extension MainTabBarController: NavigationBarVisibilityTogglable {}


// MARK: - Show
extension UIView {
	@discardableResult func show(animated: Bool = true, completion: CompletionHandler? = nil) -> Self {
		with { view in
			guard isHidden else { return }

			guard animated else {
				isHidden = animated
				completion?()
				return
			}

			DispatchQueue.main.async {
				UIView.animate(
					withDuration: 0.3,
					animations: { view.isHidden = !animated },
					completion: { _ in completion?() }
				)
			}
		}
	}
}

// MARK: - Hide
extension UIView {
	@discardableResult func hide(animated: Bool = true, completion: CompletionHandler? = nil) -> Self {
		with { view in
			guard !isHidden else { return }

			guard animated else {
				isHidden = !animated
				completion?()
				return
			}

			DispatchQueue.main.async {
				UIView.animate(
					withDuration: 0.3,
					animations: { view.isHidden = animated },
					completion: { _ in completion?() }
				)
			}
		}
	}
}
