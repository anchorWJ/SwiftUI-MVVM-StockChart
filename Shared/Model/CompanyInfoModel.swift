//
//  LikedStocksDataModel.swift
//  USStockNews
//
//  Created by w simple on 2021/03/30.
//

import Foundation

struct Company: Identifiable, Decodable, Hashable {
    var id = UUID()
    var companyInfo: CompanyInfo?
    var logo: Logo?
    
    init(companyInfo: CompanyInfo, logo: Logo) {
        self.companyInfo = companyInfo
        self.logo = logo
    }

    struct CompanyInfo: Decodable, Hashable {
        var symbol: String
        var sector: String
        var exchange: String
        
        init(
            symbol: String,
            sector: String,
            exchange: String
        ) {
            self.symbol = symbol
            self.sector = sector
            self.exchange = exchange
        }
    }
    
    struct Logo: Decodable, Hashable {
        var logoUrl: String
        
        init(
            logoUrl: String
        ) {
            self.logoUrl = logoUrl
        }
    }
    
    struct Quote: Decodable {
        var open: Double
        var close: Double
        var result: Double
        var realTime: Double
        
        init(
            open: Double,
            close: Double,
            result: Double,
            realTime: Double
        ) {
            self.open = open
            self.close = close
            self.result = result
            self.realTime = realTime
        }
    }
}
    

