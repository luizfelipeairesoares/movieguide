//
//  MoviesService.swift
//  movieguide
//
//  Created by Luiz Aires Soares on 9/1/16.
//  Copyright © 2016 ArcTouch. All rights reserved.
//

import Foundation
import Moya
import Moya_ModelMapper

struct MoviesService: BaseService {
    
    private let provider: MoyaProvider<APIMovieDatabase> = MoyaProvider<APIMovieDatabase>(endpointClosure: { (target: APIMovieDatabase) -> Endpoint<APIMovieDatabase> in
        let url = target.baseURL.URLByAppendingPathComponent(target.path).absoluteString
        let endpoint: Endpoint<APIMovieDatabase> = Endpoint<APIMovieDatabase>(URL: url,
            sampleResponseClosure: { .NetworkResponse(200, target.sampleData)},
            method: target.method,
            parameters: target.parameters,
            parameterEncoding: target.parameterEncoding)
        return endpoint
    }, plugins: [NetworkLoggerPlugin(verbose: true)])
    
    // MARK: - Requests
    
    internal func upcomingMovies(completionHandler: Result<[Movie], Errors> -> Void) {
        self.provider.request(.upcoming) { (result) in
            switch result {
            case .Success(let response):
                if (response.statusCode == 200) {
                    do {
                        let movies: [Movie] = try response.mapArray(withKeyPath: "results")
                        completionHandler(Result.success(movies))
                    } catch Error.JSONMapping(response) {
                        completionHandler(Result.failure(Errors.jsonMappingError))
                    } catch {
                        completionHandler(Result.failure(Errors.undefinedError(description: "Oops! Something went wrong!")))
                    }
                } else {
                    completionHandler(self.handleError(code: response.statusCode) as Result<[Movie], Errors>)
                }
            case .Failure(let error):
                completionHandler(self.handleError(code: error._code) as Result<[Movie], Errors>)
            }
        }
    }
    
    internal func requestSelectedMovie(movieID: String, completionHandler: Result<Movie, Errors> -> Void) {
        self.provider.request(.movie(movieID: movieID)) { (result) in
            switch result {
            case .Success(let response):
                if (response.statusCode == 200) {
                    do {
                        let movie: Movie = try response.mapObject()
                        completionHandler(Result.success(movie))
                    } catch Error.JSONMapping(response) {
                        completionHandler(Result.failure(Errors.jsonMappingError))
                    } catch {
                        completionHandler(Result.failure(Errors.undefinedError(description: "Oops! Something went wrong!")))
                    }
                } else {
                    completionHandler(self.handleError(code: response.statusCode) as Result<Movie, Errors>)
                }
            case .Failure(let error):
                completionHandler(self.handleError(code: error._code) as Result<Movie, Errors>)
            }
        }
    }
}
