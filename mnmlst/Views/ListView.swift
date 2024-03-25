//
//  ListView.swift
//  mnmlst
//
//  Created by Rob Bryson on 2/5/24.
//

import SwiftUI

struct ListView: View {
    let theme : Theme
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var isHidden = false
    
    var body: some View {
        ZStack { theme.mainColor.ignoresSafeArea()
            VStack {

                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .listRowSeparator(/*@START_MENU_TOKEN@*/.hidden/*@END_MENU_TOKEN@*/)
                            .listRowBackground(Color.green.opacity(0.0))
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                            }
                        }
                    }
                    .onDelete(perform: listViewModel.deleteItem)

                }
                .scrollIndicators(.hidden)
                .scrollDismissesKeyboard(.interactively)
                .scenePadding()
                .listStyle(.plain)
                   
                AddView()
                Spacer()
                    .persistentSystemOverlays(.hidden)

            }
        }
    }
}

#Preview {
    ListView(theme: .seafoam)
    .environmentObject(ListViewModel())
}
