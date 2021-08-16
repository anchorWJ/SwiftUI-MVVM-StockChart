//
//  UserDefaultsManager.swift
//  USStockNews
//
//  Created by w simple on 2021/08/10.
//

import Foundation
import Combine

class UserDefaultsManager: ObservableObject {
    let willChange = PassthroughSubject<Void, Never>()
    var stock: [String] = UserDefaults.stock
}

extension UserDefaults {
    private struct Keys {
        static var newStock: [String] = []
    }
    
    static var stock: [String] {
        get {
            return UserDefaults.standard.array(forKey: "newStock") as? [String] ?? ["RKT", "AAPL", "FB", "WMT"]
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "newStock")
        }
    }
}
