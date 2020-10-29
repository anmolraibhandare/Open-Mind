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
      UITableView.appearance().separatorColor = .clear
      let cellSize = CGSize(width: 100, height: 100)
      return GeometryReader { geometry in
        List {
          ShapesGrid(allShapes: ShapeType.allCases,
                     cellSize: cellSize,
                   viewSize: geometry.size)
            .listRowInsets(EdgeInsets(top: 0, leading: 0,
                                      bottom: 0, trailing: 0))
        }
      }
    }
}

struct ShapesGrid: View {
    let allShapes: [ShapeType]
    let cellSize: CGSize
    let viewSize: CGSize
    let padding: CGFloat = 10
    
    var columns: Int {
        var columns = viewSize.width / cellSize.width
        while (columns * cellSize.width + padding * columns) > viewSize.width {
          columns -= 1
        }
        return Int(columns)
    }
    
  var finalArray: [[ShapeType]] {
    var array: [[ShapeType]] = []
    var rowArray: [ShapeType] = []
    
    for i in 0..<allShapes.count {
      if i % columns == 0 {
        if i != 0 {
          array.append(rowArray)
        }
        rowArray = []
      }
      rowArray.append(allShapes[i])
    }
    while rowArray.count < columns {
      rowArray.append(ShapeType.empty)
    }
    array.append(rowArray)
    return array
  }
  var body: some View {
    ForEach(0..<finalArray.count) { rowIndex in
      HStack(spacing: 0) {
        ForEach(0..<self.finalArray[rowIndex].count) { columnIndex in
          self.finalArray[rowIndex][columnIndex].shape
          .stroke()
            .frame(width: self.cellSize.width,
                   height: self.cellSize.height)
            .padding(self.padding)
        }
      }
      .frame(width: self.viewSize.width)
    }
  }
}

struct ShapeGridView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeGridView()
    }
}
