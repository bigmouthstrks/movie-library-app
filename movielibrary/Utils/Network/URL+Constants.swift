//
//  URL+Constants.swift
//  mitelco-superapp
//
//  Created by Benjamin Cáceres on 07-06-22.
//

import Foundation

// MARK: - URL+Constants
extension URL {
	/// EngineTransaction base urls
	/// tst environment
	static var engineTransactionBaseURLtst: URL {
		let url = URL(string: .engineTransactionURLtst)
		return url!
	}
	
	/// prod environment
	static var engineTransactionBaseURL: URL {
		let url = URL(string: .engineTransactionURL)
		return url!
	}
	
	 
	/// Atenea base urls
	/// tst environment
	static var ateneaBaseURLtst: URL {
		let url = URL(string: .ateneaBaseURLtst)
		return url!
	}
	
	/// prod environment
	static var ateneaBaseURL: URL {
		let url = URL(string: .ateneaBaseURL)
		return url!
	}
	
	/// API base urls
	/// tst environment
	static var apiBaseURLtst: URL {
		let url = URL(string: .apiBaseURLtst)
		return url!
	}
	
	/// prod environment
	static var apiBaseURL: URL {
		let url = URL(string: .apiBaseURL)
		return url!
	}
	
	/// Cerberus base urls
	/// prod environment
	static var cerberusBaseURL: URL {
		let url = URL(string: .cerberusBaseURL)
		return url!
	}
	
	/// tst environment
	static var cerberusBaseURLtst: URL {
		let url = URL(string: .cerberusBaseURLtst)
		return url!
	}
	
	/// prod environment
	static var nativeFlowBaseURL: URL {
		let url = URL(string: .nativeFlowBaseURL)
		return url!
	}
	
	
	/// tst environment
	static var nativeFlowBaseURLtst: URL {
		let url = URL(string: .nativeFlowBaseURLtst)
		return url!
	}
}
