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
        
        
        ZStack { Color.green.opacity(0.2).ignoresSafeArea()
            VStack {
                Spacer()
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
//                    .onMove(perform: listViewModel.moveItem)
                }
                .scrollIndicators(.hidden)
                .scrollDismissesKeyboard(.interactively)
                .scenePadding()
                .listStyle(.plain)
//                            Button(action: {
//                                listViewModel.deleteTheItem()
//                            }, label: {
//                                Image(systemName: "plus.circle")
//                                    .foregroundStyle(.red)
//                                    .font(.largeTitle)
//                                    .rotationEffect(.degrees(45))
//                
//                            })
                AddView()
                Spacer()
                    .persistentSystemOverlays(.hidden)
            }
            
        }
        
        
    }
    
}

#Preview {
        ListView()
    .environmentObject(ListViewModel())
}
