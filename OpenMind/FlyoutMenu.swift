//
//  FlyoutMenu.swift
//  OpenMind
//
//  Created by Anmol Raibhandare on 10/29/20.
//  Copyright © 2020 Anmol Raibhandare. All rights reserved.
//

import SwiftUI

struct FlyoutMenuOption {
  var image: Image
  var color: Color
  var action: () -> Void = {}
}

struct FlyoutMenu: View {
  let flyoutMenuOptions: [FlyoutMenuOption]
  let iconDiameter: CGFloat = 44
  let menuDiameter: CGFloat = 150
  var radius: CGFloat {
    return menuDiameter / 2
  }
  @State var isOpen = false
  
    var body: some View {
      ZStack {
        Circle()
          .foregroundColor(.pink)
          .opacity(0.1)
          .frame(width: isOpen ? menuDiameter + iconDiameter : 0)
        
        ForEach(flyoutMenuOptions.indices) { index in
          self.drawOption(index: index)
        }
        
        FlyoutMenuMain(isOpen: self.$isOpen)
      }
    }
  
  func drawOption(index: Int) -> some View {
    let angle = .pi / 4 * CGFloat(index) - .pi / 1.7
    let offset = CGSize(width: cos(angle) * radius,
                        height: sin(angle) * radius)
    let option = flyoutMenuOptions[index]
    return Button(action: {
      option.action()
    }) {
      ZStack {
        Circle()
          .foregroundColor(option.color)
        option.image
          .font(.system(size: 20, weight: .medium))
          .foregroundColor(.white)
      }
    }
  .offset(offset)
    .frame(width: 44)
    .scaleEffect(self.isOpen ? 1.0 : 0.01)
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
  static var flyoutMenuOptions: [FlyoutMenuOption] = [
    FlyoutMenuOption(image: Image(systemName: "trash"),
                     color: .blue),
    FlyoutMenuOption(image: Image(systemName: "link"),
                     color: .purple)
  ]
    static var previews: some View {
        FlyoutMenu(flyoutMenuOptions: flyoutMenuOptions)
    }
}
