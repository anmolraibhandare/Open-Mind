//
//  ColorSliderView.swift
//  OpenMind
//
//  Created by Anmol Raibhandare on 10/29/20.
//  Copyright © 2020 Anmol Raibhandare. All rights reserved.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var sliderValue: Double
    var range: ClosedRange<Double> = 0...1
    var color: Color = .red
    
    var body: some View {
        let gradient = LinearGradient(gradient: Gradient(colors: [.black, color, .white]), startPoint: .leading, endPoint: .trailing)
        
        return GeometryReader { geometry in
            
            ZStack(alignment: .leading) {
            gradient
            .cornerRadius(5)
                .frame(height: 10)
                SliderCircleView(value: self.$sliderValue,
                                 range: self.range,
                                 sliderWidth: geometry.size.width)
            }
        }
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    @State static var sliderValue: Double = 20
    static var previews: some View {
        ColorSliderView(sliderValue: $sliderValue,
                        range: 0...50,
                        color: .red)
    }
}

struct SliderCircleView: View {
    @Binding var value: Double
    let range: ClosedRange<Double>
    
    let diameter: CGFloat = 30
    @State private var offset: CGSize = .zero
    let sliderWidth: CGFloat
    
    
    var slidervalue: Double {
        let percent = Double(offset.width / (sliderWidth - diameter))
        let value = (range.upperBound - range.lowerBound) * percent + range.lowerBound
        return value
    }
    
    var body: some View {
        let drag = DragGesture()
            .onChanged{
                self.offset.width = self.clampWidth(translation: $0.translation.width)
                self.value = self.slidervalue
        }
        return Circle()
            .foregroundColor(.white)
            .shadow(color: .gray, radius: 1)
            .frame(width: diameter, height: diameter)
        .gesture(drag)
        .offset(offset)
    }
    
    func clampWidth(translation: CGFloat) -> CGFloat {
        return min(sliderWidth - diameter,
                   max(0,  offset.width + translation))
    }
    
}
