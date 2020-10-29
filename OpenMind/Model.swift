//
//  Model.swift
//  OpenMind
//
//  Created by Anmol Raibhandare on 10/29/20.
//  Copyright © 2020 Anmol Raibhandare. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

let minCellSize = CGSize(width: 200, height: 100)

struct Cell: Identifiable, Equatable {
    var id = UUID()
    var color = Color.black
    var size = minCellSize
    var offset = CGSize.zero
    var shapeType = ShapeType.roundedRect
    var text = "Default cell text"
}

class CellData: ObservableObject {
    @Published var selectedCell: Cell?
    
    @Published var cells: [Cell] = [
        Cell(color: .red,
             text: "Drawing in SwiftUI"),
        Cell(color: .green,
             offset: CGSize(width: 100, height: 300),
             text: "Shapes")
    ]
    
    func indexOf(cell: Cell) -> Int {
        guard let index = cells.firstIndex(where: {
            $0.id == cell.id
        }) else {
            fatalError("Cell \(cell) does not exist")
        }
        return index
    }
    
    func addCell(offset: CGSize) -> Cell {
        let cell = Cell(offset: offset)
        cells.append(cell)
        return cell
    }
}
