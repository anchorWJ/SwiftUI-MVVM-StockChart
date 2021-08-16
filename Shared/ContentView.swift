//
//  ContentView.swift
//  Shared
//
//  Created by w simple on 2021/03/30.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical) {
            MainView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

