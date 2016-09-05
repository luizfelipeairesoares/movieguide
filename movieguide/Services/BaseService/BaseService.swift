//
//  BaseService.swift
//  movieguide
//
//  Created by Luiz Aires Soares on 9/1/16.
//  Copyright © 2016 ArcTouch. All rights reserved.
//

import Foundation
import Moya

protocol BaseService {
    func handleError<T>(code code: Int) -> Result<T, Errors>
}

extension BaseService {
    
    func handleError<T>(code code: Int) -> Result<T, Errors> {
        switch (code) {
        case 401:
            return Result.failure(Errors.userUnauthorizedError)
        case 403:
            return Result.failure(Errors.requestUnauthorizedError)
        case 404:
            return Result.failure(Errors.routeNotAvailable)
        default:
            return Result.failure(Errors.undefinedError(description: "Ops! Something went wrong."))
        }
    }
}
