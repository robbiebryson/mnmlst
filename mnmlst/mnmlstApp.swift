//
//  mnmlstApp.swift
//  mnmlst
//
//  Created by Rob Bryson on 2/5/24.
//

import SwiftUI

@main
struct mnmlstApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ListView(theme: .seafoam)
            .environmentObject(listViewModel)
        }
    }
}
