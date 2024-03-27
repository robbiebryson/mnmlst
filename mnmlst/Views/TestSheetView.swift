//
//  TestSheetView.swift
//  mnmlst
//
//  Created by Rob Bryson on 3/26/24.
//

import SwiftUI

struct TestSheetView: View {
    @State private var showingSheet = false

    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SettingsSheetView()
        }
    }
}

#Preview {
    TestSheetView()
}
