//
//  MainView.swift
//  USStockNews
//
//  Created by w simple on 2021/08/09.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var stockVM = LikedStocksViewModel()

    var body: some View {
        VStack(spacing: 4.0) {
            LazyVGrid(
                columns: Array(repeating: .init(.flexible(), spacing: 16), count: 2),
                spacing: 16
            ) {
                ForEach(self.stockVM.companyInfo, id: \.self) { item in
                    CardView(companyInfo: item)
                }
               
            }
            
        }.onAppear(perform: fetch)
    }
    
    private func fetch() {
        for stock in UserDefaults.stock {
            self.stockVM.fetchCompany(symbol: stock)
            print(stock)
            self.stockVM.fetchCompanyLogo(symbol: stock)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
