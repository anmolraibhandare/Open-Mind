//
//  ColorPickerView.swift
//  OpenMind
//
//  Created by Anmol Raibhandare on 10/29/20.
//  Copyright © 2020 Anmol Raibhandare. All rights reserved.
//

import SwiftUI

struct ColorPickerView: View {
    @State var pickedColor: PickedColor = .red
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(pickedColor.color)
                .frame(width: 250)
            ColorPicker(pickedColor: $pickedColor)
            
        }
    }
}

struct ColorPicker: View {
    @Binding var pickedColor: PickedColor
    
    let diameter: CGFloat = 40
    
    var body: some View {
        HStack {
            ForEach(PickedColor.allCases, id: \.self) { pickedColor in
                ZStack {
                    Circle()
                        .foregroundColor(pickedColor.color)
                        .frame(width: self.diameter, height: self.diameter)
                        .onTapGesture {
                            self.pickedColor = pickedColor
                    }
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: self.pickedColor == pickedColor ? self.diameter * 0.25 : 0, height: self.diameter)
                }
            }
        }
        .frame(height: diameter * 3)
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView()
    }
}
