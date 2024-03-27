//
//  ListRowView.swift
//  mnmlst
//
//  Created by Rob Bryson on 2/5/24.
//

import SwiftUI

struct ListRowView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    let item: ItemModel
//    @State private var showingSheet = false
//    private var colorData = ColorData()
//    @State private var color: Color = Color.green

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "circle")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                    .foregroundStyle(item.isCompleted ? .white : .green)
                    .background(item.isCompleted ? .green : .white)
                    .cornerRadius(100)

                Text(item.title)
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                            .fontWeight(.semibold)
                            .foregroundStyle(item.isCompleted ? .green.opacity(0.8) : .primary)
                    
            }

        }
//        .onAppear {
//            color = colorData.loadColor()
//        }
    }
}
//#Preview {
//    let item1 = ItemModel(title: "First Item", isCompleted: false)
//    let item2 = ItemModel(title: "Second", isCompleted: true)
//    
//    return Group {
//        ListRowView(item: item1)
//        ListRowView(item: item2)
//            .environmentObject(ListViewModel())
//
//    }
//}
