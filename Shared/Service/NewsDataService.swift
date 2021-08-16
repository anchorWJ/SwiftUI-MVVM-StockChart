//
//  NewsDataService.swift
//  USStockNews (iOS)
//
//  Created by w simple on 2021/04/04.
//

import Foundation
import Reachability

enum NetworkError: Error {
    case URLError
    case NoData
    case DecodingError
    case NetworkFailed
}

class NewsDataService {
    
    func getCompany(symbol: String, completion: @escaping(Result<Company.CompanyInfo?, NetworkError>) -> Void) {
        
        guard let url = URL.companyURL(symbol: symbol) else {
            return completion(.failure(.URLError))
        }
        
        let networkReachability = try! Reachability()
        networkReachability.whenUnreachable = { _ in
            completion(.failure(.NetworkFailed))
            print("Not reachable")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.NoData))
            }
            
            let companyRespose = try? JSONDecoder().decode(Company.CompanyInfo.self, from: data)
            
            if let unwrappedCompanyRespose = companyRespose {
                completion(.success(unwrappedCompanyRespose.self))
            } else {
                completion(.failure(.DecodingError))
            }
        }.resume()
        
    }
    
    func getCompanyLogo(symbol: String, completion: @escaping(Result<Company.Logo?, NetworkError>) -> Void) {
        
        guard let url = URL.logoURL(symbol: symbol) else {
            return completion(.failure(.URLError))
        }
        
        let networkReachability = try! Reachability()
        networkReachability.whenUnreachable = { _ in
            completion(.failure(.NetworkFailed))
            print("Not reachable")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.NoData))
            }
            
            let companyLogoRespose = try? JSONDecoder().decode(Company.Logo.self, from: data)
            
            if let unwrappedCompanyLogoRespose = companyLogoRespose {
                completion(.success(unwrappedCompanyLogoRespose.self))
            } else {
                completion(.failure(.DecodingError))
            }
        }.resume()
        
    }
}
