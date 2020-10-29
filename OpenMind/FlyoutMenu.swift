//
//  FlyoutMenu.swift
//  OpenMind
//
//  Created by Anmol Raibhandare on 10/29/20.
//  Copyright © 2020 Anmol Raibhandare. All rights reserved.
//

import SwiftUI

struct FlyoutMenu: View {
    @State var isOpen = false
    
    
    var body: some View {
        FlyoutMenuMain(isOpen: self.$isOpen)
    }
}

struct FlyoutMenuMain: View {
    @Binding var isOpen: Bool
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                self.isOpen.toggle()
            }
            self.endTextEditing()
        }) {
            ZStack {
                Circle()
                    .foregroundColor(.red)
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .medium))
                    .rotationEffect(isOpen ? Angle.degrees(45) : Angle.degrees(0))
            }
        }
        .frame(width: 44, height: 44)
    }
}

struct FlyoutMenu_Previews: PreviewProvider {
    static var previews: some View {
        FlyoutMenu()
    }
}
