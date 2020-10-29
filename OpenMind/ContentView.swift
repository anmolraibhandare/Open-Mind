//
//  ContentView.swift
//  OpenMind
//
//  Created by Anmol Raibhandare on 10/28/20.
//  Copyright © 2020 Anmol Raibhandare. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.yellow.edgesIgnoringSafeArea(.all)
            Circle().inset(by: 10)
                .stroke(lineWidth: 20).opacity(0.4).foregroundColor(.blue).background(Circle().foregroundColor(.green))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
