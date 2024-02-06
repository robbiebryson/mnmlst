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
 
    

    var body: some View {
        HStack {
            TextField("Type something here...", text: $textFieldText)
                .font(.title2)
                .foregroundColor(/*@START_MENU_TOKEN@*/.pink/*@END_MENU_TOKEN@*/)
                
//            Button(action: {
//                presentationMode.wrappedValue.dismiss()
//            }, label: {
//                Image(systemName: "plus.circle")
//                    .foregroundStyle(.red)
//                    .font(.title)
//                    .rotationEffect(.degrees(45))
//                    
//            })
            Button(action: {
                saveButtonPressed()
            }, label: {
                Image(systemName: "plus.circle")
                    .foregroundStyle(.green)
                    .font(.title)
            })
        }
        .padding(.horizontal, 45)
    }
    
    
    func saveButtonPressed() {
        listViewModel.addItem(title: textFieldText)
        textFieldText = ""
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    AddView()
        .environmentObject(ListViewModel())
}
