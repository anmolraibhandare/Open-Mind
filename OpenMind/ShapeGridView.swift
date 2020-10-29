//
//  ShapeGridView.swift
//  OpenMind
//
//  Created by Anmol Raibhandare on 10/29/20.
//  Copyright © 2020 Anmol Raibhandare. All rights reserved.
//

import SwiftUI

struct ShapeGridView: View {
    var body: some View {
        let style = StrokeStyle(lineWidth: 5, lineJoin: .round)
        return List {
            ForEach(ShapeType.allCases, id: \.self) { shape in
                shape.shape
                    .stroke(style: style)
                    .background(Color.white)
                    .frame(height: 200)
                .padding()
            }
        }
    }
}

struct ShapeGridView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeGridView()
    }
}
