//
//  Colors.swift
//  mono
//
//  Created by Cameron Zollinger on 3/29/25.
//

import SwiftUI

struct Colors {
    let colorScheme: ColorScheme

    var grey100: Color {
        colorScheme == .dark
            ? Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255)
            : Color(red: 210 / 255, green: 210 / 255, blue: 210 / 255)
    }

    var grey900: Color {
        colorScheme == .dark
            ? Color(red: 210 / 255, green: 210 / 255, blue: 210 / 255)
            : Color(red: 30 / 255, green: 30 / 255, blue: 30 / 255)
    }
}
