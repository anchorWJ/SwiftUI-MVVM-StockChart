//
//  URLExtensions.swift
//  USStockNews
//
//  Created by w simple on 2021/04/01.
//

import Foundation

extension URL {
    static var baseUrl: URLComponents {
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "cloud.iexapis.com"
        urlComponents.queryItems = [ tokenQueryItem ]
        
        return urlComponents
    }
    
    static func companyURL(symbol: String) -> URL? {
        var urlAddPath = baseUrl
        urlAddPath.path = "/v1/stock/\(symbol)/company"
        
        let url = urlAddPath.url
        
        return url
    }
    
    static func logoURL(symbol: String) -> URL? {
        var urlAddPath = baseUrl
        urlAddPath.path = "/v1/stock/\(symbol)/logo"
        
        let url = urlAddPath.url
        
        return url
    }
    
    static func quoteUrl(symbol: String) -> URL? {
        var urlAddPath = baseUrl
        urlAddPath.path = "/v1/stock/\(symbol)/quote"
        
        let url = urlAddPath.url
        
        return url
    }
    
    static var tokenQueryItem: URLQueryItem {
        let queryItem = URLQueryItem(name: "token", value: "pk_0f1c02487c1941c78c156180cbc212f0")

        return queryItem
    }
}

