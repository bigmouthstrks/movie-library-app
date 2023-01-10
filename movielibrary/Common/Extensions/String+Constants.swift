//
//  String+Constants.swift
//

import Foundation

// MARK: - General usage
extension String {
    static let empty = ""
    static let zero = "0"
    static let defaultAcceptActionTitle = "Aceptar"
    static let defaultAlertTitle = "Atención"
    static let defaultAlertMessage = "Ha ocurrido un error, vuelva a intentarlo"
    static let cancel = "Cancelar"
    static let appLocale = "es_CL"
	static let bullet = "\u{2022}"
	static let noInfo = "Sin información"
	static let noInfoBullet = "\u{2022} Sin información"
}

// MARK: - Mitelco app constants
extension String {
	static let authorizeTabTitle = "Autorizar"
	static let activityTabTitle = "Actividad"
	static let profileTabTitle = "Perfil"
	static let dynamicKeyDescription = "Utiliza esta clave para aprobar trus transacciones en línea."
	
	// MARK: - AppCredentials
	enum AppCredentials {
		static let serviceName = Bundle.main.bundleIdentifier ?? "com.trust.demonativeclaro"
		static let accessGroup = "P896AB2AMC.trust"
		
		static let clientId = "9d2785c9-01d7-4bf3-a998-588118cc121c"
		static let clientSecret = "QA88H3hAXNHXJnZvWXS7GPAadx"

		static let webClient = "ca9f37c3-b3e8-4363-8432-17b4edc23585"
		static let webSecret = "ltIIcgWp9s4Ta-pnkVEWEujm.l"
		
		static let auditClient = "9a0552f5-33e2-4627-b512-98b94b02e955"
		static let auditSecret = "6cfe0f1a-439d-4a26-bae0-1b2b8021239a"
	}
	
	// MARK: - TrustValues
	enum TrustValues {
		static let scopes = "openid offline_access transaction-context.products.r transaction-context.transaction.w transaction-context.transaction.r engine.transaction.validate cerberus.2fa_method.w cerberus.2fa_method.trusted_register cerberus.2fa_method.totp_secret"
		static let redirectURI = "com.trust.demonativeclaro://main"
		
		static let nativeGrantType = "urn:ietf:params:oauth:grant-type:native_code"
	}
	
	// MARK: - ButtonTitles
	enum ButtonTitles {
		static let qrScanner = "Lector QR"
		static let burnCode = "Quemar código"
		static let dynamicKey = "Clave dinámica"
		static let logout = "Cerrar sesión"
		static let fingerprintBiometry = "Biometria dactilar"
		static let deviceSecurity = "Seguridad dispositivo"
		static let decline = "Rechazar"
		static let copyDynamicKey = "Toca para copiar"
		static let authorize = "Autorizar"
	}
	
	// MARK: - Placeholders
	enum Placeholders {
		static let enterCode = "Ingresar código"
	}
	
	// MARK: - Instructions
	enum Instructions {
		static let burnCodeInstructions = "Dentro de los próximos 5 segundos recibirás un código por medio de tu correo electrónico o vía SMS."
	}
	
	// MARK: - CellIdentifiers
	enum CellIdentifiers {
		static let authorizeTransactionCell = "AuthorizeTransactionCell"
		static let emptyTransactionCell = "EmptyTransactionCell"
		static let profileToolCell = "ToolsCollectionViewCell"
		static let activityTransactionCell = "ActivityTransactionCell"
	}
	
	// MARK: - Autorizar
	static let authorizationTitle = "Por autorizar"
	static let toolsTitle = "Mis herramientas"
	static let activityTitle = "Mis movimientos"
	
	// MARK - ViewTitles
	static let authorizationDetailTitle = "Autorizar transaccion"
	static let dynamicKeyTitle = "Clave dinámica"
	static let authorizeTransactionTitle = "Autorizar transaccion"
	static let burnCodeTitle = "Quemar código"
	
	
	static let errorAlertTitle = "Compra fallida"
	static let errorAlertDescription = "La transacción no se pudo completar correctamente."
	static let errorLeftButtonTitle = "Cancelar"
	static let errorRightButtonTitle = "Rechazar"
	
	static let warningAlertTitle = "¡Atención!"
	static let warningAlertDescription = "Ha ocurrido un error, por favor vuelve a intentarlo más tarde"
	static let warningRightButtonTitle = "Entendido"
	
	static let successAlertTitle = "Compra exitosa"
	static var successAlertDescriptionTimeRemaining = ""
	static let successAlertDescription = "Ya puedes disfrutar de tu película, recuerda que tienes \(successAlertDescriptionTimeRemaining) para verla cuantas veces quieras."
	static let successLeftButtonTitle = "Cerrar"
	static let successRightButtonTitle = "Cerrar"
	
	// MARK: - BaseURLs
	static let apiBaseURL = "https://api.trust.lat"
	static let apiBaseURLtst = "https://api-tst.trust.lat"
	static let cerberusURL = "https://cerberus.trust.lat"
	static let cerberusURLtst = "https://cerberus-tst.trust.lat"
	static let ateneaBaseURL = "https://atenea.trust.lat"
	static let ateneaBaseURLtst = "https://atenea-tst.trust.lat"
	static let engineTransactionURL = "\(apiBaseURL)/transaction-engine/v1"
	static let engineTransactionURLtst = "\(apiBaseURLtst)/transaction-engine/v1"
	static let cerberusOrigin = "cerberus.trust.lat"
	static let cerberusBaseURL = "\(cerberusURL)/v1"
	static let cerberusBaseURLtst = "\(cerberusURLtst)/v1"
	static let nativeFlowBaseURL = "https://flow.trust.lat"
	static let nativeFlowBaseURLtst = "https://api-tst.trust.lat/flow-assistance"
}
