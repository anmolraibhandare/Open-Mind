//
//  BackgroundView.swift
//  OpenMind
//
//  Created by Anmol Raibhandare on 10/29/20.
//  Copyright © 2020 Anmol Raibhandare. All rights reserved.
//

import SwiftUI

struct BackgroundView: View {
    
    @EnvironmentObject var cellData: CellData
    
    
    var body: some View {
        let doubleTap = TapGesture(count: 2)
            .onEnded {
                print("Double Tap")
        }
        return ZStack{
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            ForEach(self.cellData.cells) { cell in
                CellView(cell: cell)
            }
        }
    .gesture(doubleTap)
        .onTapGesture {
            self.cellData.selectedCell = nil
            self.endTextEditing()
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
        .environmentObject(CellData())
    }
}
