//
//  NewsList.swift
//  USStockNews
//
//  Created by w simple on 2021/03/30.
//

import SwiftUI

struct NewsList: View {
    let staredNewsData: staredNewsDataViewModel
    
    var body: some View {
        List {
            ForEach(staredNewsData) { item in
                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
            }
            
        }
    }
}

struct NewsList_Previews: PreviewProvider {
    static var previews: some View {
        NewsList()
    }
}
