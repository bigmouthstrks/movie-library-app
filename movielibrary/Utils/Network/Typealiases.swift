//
//  Typealiases.swift
//
//  Created by Benjamin Cáceres on 15-02-22.
//

/// ResultHandler is used for representing the network calls responses
typealias ResultHandler<T> = ((Result<T, AppError>) -> Void)

/// CompletionHandler is used for passing closures as parameters more easily
typealias CompletionHandler = (() -> Void)

/// SuccessHandler is used for passing closures as parameters with arguments
typealias SuccessHandler<T> = ((T) -> Void)
