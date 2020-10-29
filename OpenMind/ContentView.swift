//
//  ContentView.swift
//  OpenMind
//
//  Created by Anmol Raibhandare on 10/28/20.
//  Copyright © 2020 Anmol Raibhandare. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var cellData: CellData
    @State private var showShapes = false
    @State private var sliderValue: Double = 0
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                BackgroundView(size: geometry.size)
            }
            HStack {
                ColorSliderView(sliderValue: self.$sliderValue, range: -1...1, color: .blue)
                Text("\(self.sliderValue)")
            }
        .padding()
            .frame(height: 80)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().colorScheme(.light)
        .environmentObject(CellData())
    }
}
