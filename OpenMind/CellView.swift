//
//  CellView.swift
//  OpenMind
//
//  Created by Anmol Raibhandare on 10/29/20.
//  Copyright © 2020 Anmol Raibhandare. All rights reserved.
//

import SwiftUI

struct CellView: View {
    @ EnvironmentObject var cellData: CellData
    
    let cell: Cell
    @State private var text: String = ""
    @State private var offset: CGSize = .zero
    @State private var currentOffset: CGSize = .zero
    
    static var crayonImage: Image {
        let config = UIImage.SymbolConfiguration(pointSize: 60, weight: .medium, scale: .medium)
        return Image(uiImage: UIImage(named: "crayon")!.withConfiguration(config))
    }
    
    var isSelected: Bool {
        cell == cellData.selectedCell
    }
    
    var body: some View {
        let drag = DragGesture()
            .onChanged { drag in
                self.offset = self.currentOffset + drag.translation
        }
        .onEnded { drag in
            self.offset = self.currentOffset + drag.translation
            self.currentOffset = self.offset
        }
        return  ZStack{
            cell.shapeType.shape
                .foregroundColor(.white)
            TextField("Enter cell text", text: $text)
                .padding()
                .lineLimit(nil)
                .multilineTextAlignment(.center)
            cell.shapeType.shape
                .stroke(isSelected ? Color.orange: cell.color, lineWidth: 3)
        }
        .frame(width: cell.size.width,
               height: cell.size.height)
            .offset(cell.offset + offset)
            .onAppear{
                self.text = self.cell.text
        }
        .onTapGesture {
            self.cellData.selectedCell = self.cell
        }
        .simultaneousGesture(drag)
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(cell: Cell())
            .previewLayout(.sizeThatFits)
        .padding()
        .environmentObject(CellData())
    }
}
