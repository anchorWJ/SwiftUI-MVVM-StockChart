//
//  CardView.swift
//  USStockNews
//
//  Created by w simple on 2021/08/08.
//

import SwiftUI

struct CardView: View {
    var companyInfo: Company.CompanyInfo
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {

            Text(self.companyInfo.exchange)
                .bold()
                .font(.headline)
            Text(self.companyInfo.sector)
                .bold()
                .font(.headline)
            Text(self.companyInfo.symbol)
                .bold()
                .font(.headline)
        }
    }
}
 
