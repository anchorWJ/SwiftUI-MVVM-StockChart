//
//  LikedStocksViewModel.swift
//  USStockNews (iOS)
//
//  Created by w simple on 2021/04/04.
//

import Foundation

enum ImageError: Error {
    case ImageError
}

class LikedStocksViewModel: ObservableObject {
    
    @Published var companyInfo: [Company.CompanyInfo]
    @Published var logo: [Company.Logo]

    public init() {
        self.companyInfo = []
        self.logo = []
    }

    func fetchCompany(symbol: String) {
        NewsDataService().getCompany(symbol: symbol) { result in
            switch result {
            case .success(let companyInfo):
                DispatchQueue.main.async {
                    if let unwrappedCompanyInfo = companyInfo {
                        self.companyInfo.append(Company.CompanyInfo(symbol: unwrappedCompanyInfo.symbol, sector: unwrappedCompanyInfo.sector, exchange: unwrappedCompanyInfo.exchange))
                    }
                    print(self.companyInfo[0].exchange)
                }
            case .failure(_ ):
                print("error")
            }
        }
    }
    
    func fetchCompanyLogo(symbol: String) {
        NewsDataService().getCompanyLogo(symbol: symbol) { result in
            switch result {
            case .success(let logo):
                DispatchQueue.main.async {
                    if let unwrappedLogo = logo {
                        self.logo.append(Company.Logo(url: unwrappedLogo.url))
                        print(unwrappedLogo.url)
                    }
                }
            case .failure(_ ):
                print("error")
            }
        }
    }
    
    func fetchAll(symbol: String) {
        self.fetchCompany(symbol: symbol)
        self.fetchCompanyLogo(symbol: symbol)
    }
}
