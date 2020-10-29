//
//  PickedColor.swift
//  OpenMind
//
//  Created by Anmol Raibhandare on 10/29/20.
//  Copyright © 2020 Anmol Raibhandare. All rights reserved.
//

import Foundation
import SwiftUI

enum PickedColor: CaseIterable {
    case black, blue, green, orange, red, yellow
    
    var color: Color {
        return Color(uiColor)
    }
    var uiColor: UIColor {
        switch self {
        case . black:
            return UIColor(named: "Black")!
        case .blue:
            return UIColor(named: "Blue")!
        case .green:
            return UIColor(named: "Green")!
        case .orange:
            return UIColor(named: "Orange")!
        case .red:
            return UIColor(named: "Red")!
        case .yellow:
            return UIColor(named: "Yellow")!
        }
    }
}
