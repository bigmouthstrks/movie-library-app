//
//  AuthenticationRequestable.swift
//  demonativeclaro
//
//  Created by Benjamin Cáceres on 02-11-22.
//

import Foundation
import AuthenticationServices

// MARK: - ASAuthorizationControllerPresentationContextProviding
protocol AuthenticationRequestable: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {}

// MARK: - AuthorizationRequestable
extension AuthenticationRequestable where Self: UIViewController{
	func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
		return self.view.window!
	}
}
