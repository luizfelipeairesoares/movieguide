//
//  APIMovieDatabase.swift
//  movieguide
//
//  Created by Luiz Aires Soares on 9/1/16.
//  Copyright © 2016 ArcTouch. All rights reserved.
//

import Foundation
import Moya

enum APIMovieDatabase {
    case upcoming
    case movie(movieID: String)
}

extension APIMovieDatabase: TargetType {
    
    var baseURL: NSURL {
        return NSURL(string: "http://api.themoviedb.org/3/")!
    }
    
    var path: String {
        switch self {
        case .upcoming:
            return "movie/upcoming"
        case .movie(let movieID):
            return "movie/\(movieID)"
        }
    }
    
    var method: Moya.Method {
        return .GET
    }
    
    var parameters: [String : AnyObject]? {
        return ["api_key" : "25861e5a9063613ce089a1379c50a5f2"]
    }
    
    var parameterEncoding: Moya.ParameterEncoding {
        return .URL
    }
    
    var sampleData: NSData {
        return NSData()
    }
    
    var multipartBody: [MultipartFormData]? {
        return nil
    }
}
