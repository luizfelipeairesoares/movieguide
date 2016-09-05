//
//  Genre.swift
//  movieguide
//
//  Created by Luiz Aires Soares on 9/4/16.
//  Copyright © 2016 ArcTouch. All rights reserved.
//

import Foundation
import Mapper

struct Genre: Mappable {
    let id: Int?
    let name: String?

    init(map: Mapper) {
        self.id = map.optionalFrom("id")
        self.name = map.optionalFrom("name")
    }
}
