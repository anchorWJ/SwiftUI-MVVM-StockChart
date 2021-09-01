//
//  CardImageView.swift
//  USStockNews
//
//  Created by w simple on 2021/08/19.
//

import SwiftUI

struct CardImageView: View {
    var companyInfo: Company.Logo
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: self.companyInfo.url)) {  image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding()
            } placeholder: {
                placeholderImage()
            }
        }
    }
    
    @ViewBuilder
    func placeholderImage() -> some View {
        Image(systemName: "photo")
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
            .foregroundColor(.gray)
    }
}


