//
//  CellView.swift
//  OpenMind
//
//  Created by Anmol Raibhandare on 10/29/20.
//  Copyright © 2020 Anmol Raibhandare. All rights reserved.
//

import SwiftUI

struct CellView: View {
    let cell: Cell
    @State private var text: String = ""
    
    
    var body: some View {
        ZStack{
            cell.shapeType.shape
                .foregroundColor(.white)
            TextField("Enter cell text", text: $text)
                .padding()
                .lineLimit(nil)
                .multilineTextAlignment(.center)
            cell.shapeType.shape
                .stroke(cell.color, lineWidth: 3)
        }
        .frame(width: cell.size.width,
               height: cell.size.height)
            .offset(cell.offset)
            .onAppear{
                self.text = self.cell.text
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(cell: Cell())
            .previewLayout(.sizeThatFits)
        .padding()
    }
}
