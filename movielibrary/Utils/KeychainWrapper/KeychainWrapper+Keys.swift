//
//  KeychainWrapper+Keys.swift
//  mitelco-superapp
//
//  Created by Benjamin Cáceres on 08-06-22.
//

import Foundation

// MARK: - KeychainWrapper
extension KeychainWrapper {
	enum Keys {
		static let fidoStatus: String = "TrustFIDOStatusKey"
		static let trustId: String = "TrustIdKey"
		static let currentEnvironment: String = "CurrentEnvironmentKey"
		static let clientSecret: String = "ClientSecretKey"
		static let accessToken: String = "AccessTokenKey"
		static let tokenType: String = "TokenTypeKey"
		static let clientId: String = "ClientIdKey"
		static let hydraIdToken: String = "HydraIdTokenKey"
		static let hydraAccessToken: String = "HydraAccessTokenKey"
		static let hydraTokenType: String = "HydraTokenTypeKey"
		static let hydraRefreshToken: String = "HydraRefreshTokenKey"
		static let appTokenType: String = "AppTokenTypeKey"
		static let appAccessToken: String = "AppAccessTokenKey"
		static let trustIDPCode: String = "TrustIDPCodeKey"
		static let totpData: String = "AppTotpDataKey"
		
		// CodableStorage Keys
		static let currentUser: String = "AppCurrentUserKey"
		static let appCredentials: String = "AppCredentialsKey"
		static let trustCredentials: String = "TrustLibsCredentialsKey"
		static let otpData: String = "TrustOTPData"
		
		
		static let googleURL = "GoogleLoginURLKey"
		static let facebookURL = "FacebookLoginURLKey"
	}
	
	enum OTPKeys {
		static let secret: String = "TOTPSecretKey"
		static let issuer: String = "TOTPIssuerKey"
		static let digits: String = "TOTPDigitsKey"
		static let seconds: String = "TOTPSecondsKey"
		static let currentData: String = "TOTPCurrentDataKey"
		static let firstRun: String = "TOTPFirstRunKey"
	}
}
