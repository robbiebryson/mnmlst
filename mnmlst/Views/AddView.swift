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
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
//    @State var showTextField: Bool
 
    

    var body: some View {
        HStack {
            TextField("Type something here...", text: $textFieldText)
                .font(.title2)
                .foregroundColor(.orange)
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
            }, label: {
                Image(systemName: "plus.circle")
                    .foregroundStyle(.green)
                    .font(.largeTitle)
            })
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
