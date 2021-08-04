//
//  StaredNewsDataViewModel.swift
//  USStockNews
//
//  Created by w simple on 2021/03/30.
//

import SwiftUI

struct StaredNewsDataModel {
    struct Symbol: Codable {
        var name: String
        var symbol: String
    }
    
    struct Quote: Codable {
        var open: Double
        var close: Double
        var result: Double
        var realTime: Double
    }
    
    struct Company:Codable {
        var name: String
        var icon: String
        var tag: String
    }
}

extension 
