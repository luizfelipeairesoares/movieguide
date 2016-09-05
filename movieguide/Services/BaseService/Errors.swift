//
//  Errors.swift
//  movieguide
//
//  Created by Luiz Aires Soares on 9/1/16.
//  Copyright © 2016 ArcTouch. All rights reserved.
//

import Foundation

enum Errors: ErrorType {
    case jsonMappingError
    case userUnauthorizedError
    case requestUnauthorizedError
    case routeNotAvailable
    case undefinedError(description: String)
    
    func message() -> String {
        switch self {
        case .jsonMappingError:
            return "Error mapping JSON"
        case .userUnauthorizedError:
            return "User not authorized"
        case .requestUnauthorizedError:
            return "Request not authorized"
        case .routeNotAvailable:
            return "Route not found"
        case .undefinedError(let description):
            return description
        }
    }
    
    static let allErrors = [jsonMappingError, userUnauthorizedError, requestUnauthorizedError, undefinedError(description: "")]
}