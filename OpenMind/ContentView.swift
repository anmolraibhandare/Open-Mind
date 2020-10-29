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
    
    var body: some View {
        GeometryReader { geometry in
            BackgroundView(size: geometry.size)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().colorScheme(.light)
        .environmentObject(CellData())
    }
}
