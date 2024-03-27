//
//  ListView.swift
//  mnmlst
//
//  Created by Rob Bryson on 2/5/24.
//

import SwiftUI

struct ListView: View {
//    let theme : Theme
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var color: Color = Color.black
    @State var isHidden = false
    @State private var showingSheet = false
    private var colorData = ColorData()

    var body: some View {
        ZStack { color.ignoresSafeArea()
            VStack {

                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .listRowSeparator(/*@START_MENU_TOKEN@*/.hidden/*@END_MENU_TOKEN@*/)
                            .listRowBackground(color.opacity(0.0))
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
                
                Button("Settings") {
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    SettingsSheetView()
                }
                   
                AddView()
                Spacer()
                    .persistentSystemOverlays(.hidden)

            }
            .onAppear {
                color = colorData.loadColor()
            }
        }
    }
}

#Preview {
    ListView()
        .environmentObject(ListViewModel())
    
}
