//
//  Result.swift
//  movieguide
//
//  Created by Luiz Aires Soares on 9/1/16.
//  Copyright © 2016 ArcTouch. All rights reserved.
//

import Foundation

enum Result<T, Errors> {
    case success(T)
    case failure(Errors)
}
