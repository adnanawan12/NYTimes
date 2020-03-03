//
//  APIRouter.swift
//  NYTimes
//
//  Created by Adnan on 3/2/20.
//  Copyright © 2020 Adnan. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
}

// An http call may need method, path and parameters. APIConfiguration helps use to define all these under one entity
protocol APIConfiguration {
    var method: HTTPMethod { get }
    var path: String { get }
    
    func asURLRequest() -> URLRequest?
}


enum APIRouter: APIConfiguration {
    //All APIs with parameters
    case day
    case week
    case month
    
    var method: HTTPMethod {
        return .get
    }
    
    //Endpont for each API call
    var path: String {
        switch self {
        case .day:
            return "/1.json"
        case .week:
            return "/7.json"
        case .month:
            return "/30.json"
        }
    }
    
    
    //Genrate URLReqeust object from path, method and paramters
    func asURLRequest() -> URLRequest? {
        guard var urlComponent = URLComponents(string: Constants.apiBaseURL) else {
            return nil
        }
        // End point
        urlComponent.path.append(self.path)
        
        var queryItems: [URLQueryItem] = []
        let item = URLQueryItem(name: "api-key", value: Constants.apiKey)
        queryItems.append(item)
     
        urlComponent.queryItems = queryItems
        
        // Parameters
        switch self.method {
        case .get:
            guard let url = urlComponent.url else {
                return nil
            }
            
            debugPrint(url)
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = method.rawValue
            return urlRequest
        case .post:
            fatalError("Not implemented for POST")
        }
    }
}

