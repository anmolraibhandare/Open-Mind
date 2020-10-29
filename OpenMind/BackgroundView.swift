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
        return ZStack{
            ForEach(self.cellData.cells) { cell in
                CellView(cell: cell)
            }
            
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
        .environmentObject(CellData())
    }
}
