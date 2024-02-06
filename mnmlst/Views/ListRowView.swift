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
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: item.isCompleted ? "circle.fill" : "circle")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .cornerRadius(100)
                   
                        //                .foregroundStyle(item.isCompleted ? .white : .green)
                        
                        //                .background(item.isCompleted ? .green : .white)
                        
                        Text(item.title)
                            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                            .fontWeight(.semibold)
                        //                .foregroundStyle(item.isCompleted ? .green.opacity(0.8) : .black)
                    
            }
        }
    }
}
#Preview {
    var item1 = ItemModel(title: "First Item", isCompleted: false)
    var item2 = ItemModel(title: "Second", isCompleted: true)
    
    return Group {
        ListRowView(item: item1)
        ListRowView(item: item2)
            .environmentObject(ListViewModel())

    }
}
