//
//  ContentView.swift
//  OpenMind
//
//  Created by Anmol Raibhandare on 10/28/20.
//  Copyright © 2020 Anmol Raibhandare. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showShapes = false
    
    var body: some View {
        
        ZStack {
            GeometryReader { geometryProxy in
                
                
            
                ZStack {
                    Color.yellow
                
            Button("Show Shapes"){
                self.showShapes.toggle()
            }
            .frame(height: geometryProxy.size.height / 2)
            .background(Color.gray)
            .sheet(isPresented: self.$showShapes) {
                ShapeGridView()
                .padding()
            }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().colorScheme(.light)
    }
}
