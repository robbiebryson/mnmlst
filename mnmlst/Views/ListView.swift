//
//  ListView.swift
//  mnmlst
//
//  Created by Rob Bryson on 2/5/24.
//

import SwiftUI

struct ListView: View {
    
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var isHidden = false
    
    var body: some View {
      
        
        VStack {
            List {
                ForEach(listViewModel.items) { item in
                    ListRowView(item: item)
                        .listRowSeparator(/*@START_MENU_TOKEN@*/.hidden/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            withAnimation(.linear) {
                                listViewModel.updateItem(item: item)
                            }
                        }
                }
                .onDelete(perform: listViewModel.deleteItem)
                .onMove(perform: listViewModel.moveItem)
            }
            .listStyle(.plain)
            AddView()
           Spacer(minLength: 50)
        }

   
    }
}


#Preview {
        ListView()
    .environmentObject(ListViewModel())
}
