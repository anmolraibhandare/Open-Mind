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
        
        let strokeStyle = StrokeStyle(lineWidth: 10,
                                      lineCap: .round,
                                      lineJoin: .round)
        
        return VStack {
            Path { path in
                path.move(to: .zero)
                path.addLine(to: CGPoint(x: 300, y: 200))
            }
            .stroke(style: strokeStyle)
            Diamond()
                .stroke(lineWidth: 10)
            Circle()
                .stroke(lineWidth: 10)
        }
    .padding(50)
    }
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width
            let height = rect.height
            
            path.addLines([
                CGPoint(x: width / 2, y: 0),
                CGPoint(x: width, y: height / 2),
                CGPoint(x: width / 2, y: height),
                CGPoint(x: 0, y: height / 2 )
            ])
            path.closeSubpath()
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().colorScheme(.light)
    }
}
