//
//  Shapes.swift
//  OpenMind
//
//  Created by Anmol Raibhandare on 10/29/20.
//  Copyright © 2020 Anmol Raibhandare. All rights reserved.
//

import SwiftUI

struct Shapes: View {
    var body: some View {
        Heart()
            .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
        .padding()
    }
}

struct Heart: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.width * 0.25,
                             y: rect.height * 0.25),
                    radius: rect.width * 0.25, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 180), clockwise: true)
        
        let control1 = CGPoint(x: 0,
                               y: rect.height * 0.8)
        let control2 = CGPoint(x: rect.width * 0.25,
                               y: rect.height * 0.95)
        path.addCurve(to: CGPoint(x: rect.width * 0.5,
                                  y: rect.height), control1: control1, control2: control2)
        
        var transform = CGAffineTransform(translationX: rect.width, y: 0)
        transform = transform.scaledBy(x: -1, y: 1)
        path.addPath(path, transform: transform)
        
        return path
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
