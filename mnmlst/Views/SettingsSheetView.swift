//
//  SettingsSheetView.swift
//  mnmlst
//
//  Created by Rob Bryson on 3/26/24.
//

import SwiftUI
import Observation

  struct ColorData {
    private var COLOR_KEY = "COLOR_KEY"
    private let userDefaults = UserDefaults.standard
    
    func saveColor(color: Color) {
        let color = UIColor(color).cgColor
        
        if let components = color.components {
            userDefaults.set(components, forKey: COLOR_KEY)
            print(components)
            print("Color Saved!")
        }
    }
    func loadColor() -> Color {
        guard let array = userDefaults.object(forKey: COLOR_KEY) as?
                [CGFloat] else { return Color.black }
        
        let color = Color(.sRGB,
                          red: array[0],
                          green: array[1],
                          blue: array[2],
                          opacity: array[3])
        
        print(color)
        print("Color Loaded")
        return color
    }
}
struct SettingsSheetView: View {
    
    @State var color: Color = Color.black
    private var colorData = ColorData()
    
    
    var body: some View {
        VStack(spacing: 10) {
            ColorPicker("Pick a Color", selection: $color)
            
            Rectangle()
                .frame(height: 200)
                .foregroundStyle(color)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
            
            
            Button("Save Color") {
                colorData.saveColor(color: color)
                
            }
            Spacer()
        }
        .padding()
        .onAppear {
            color = colorData.loadColor()
        }
    }
}


//struct SettingsSheetView: View {
//    @Environment(\.dismiss) var dismiss
//    
//    var body: some View {
//        Button("Press to dismiss") {
//            dismiss()
//        }
//        .font(.title)
//        .padding()
//        .background(.black)
//    }
//}



#Preview {
    SettingsSheetView()
}
