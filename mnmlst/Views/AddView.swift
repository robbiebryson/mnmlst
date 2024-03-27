//
//  AddView.swift
//  mnmlst
//
//  Created by Rob Bryson on 2/5/24.
//

import SwiftUI




struct AddView: View {
    
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @FocusState private var isFocused : Bool
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    @State private var showingSheet = false
    private var colorData = ColorData()
    @State private var color: Color = Color.green

//    @State var showTextField: Bool
 
    

    var body: some View {
        HStack {
            TextField("Type something here...", text: $textFieldText)
                .font(.title2)
                .foregroundColor(.pink)
                .focused($isFocused)
//                .opacity(showTextField ? 1 : 0)
                
//            Button(action: {
//                presentationMode.wrappedValue.dismiss()
//            }, label: {
//                Image(systemName: "plus.circle")
//                    .foregroundStyle(.red)
//                    .font(.largeTitle)
//                    .rotationEffect(.degrees(45))
//                    
//            })
            Button(action: {
                saveButtonPressed()
                isFocused = false
            }, label: {
                Image(systemName: "plus.circle")
                    .foregroundStyle(color.opacity(10))
                    .font(.largeTitle)
            })
        }
       
        .onAppear {
            color = colorData.loadColor()
            
        }
        .padding(.horizontal, 45)
    }
    
    
    
    func saveButtonPressed() {
        listViewModel.addItem(title: textFieldText)
        textFieldText = ""
//        showTextField = false
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    AddView()
        .environmentObject(ListViewModel())
}
