//
//  CustomColor.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 30/07/2023.
//

import Foundation
import SwiftUI

class CustomColor: ObservableObject {
    @Published var fillColor: Color = Color(red: 1, green: 0.79, blue: 0.69)
    @Published var frameColor: Color = Color(red: 1, green: 0.6, blue: 0.4)
    @Published var firstTextColor: Color = .black
    @Published var secondaryTextColor: Color = .white
    @Published var accentsColor: Color = .black
    @Published var backgroundColor: Color = Color(red: 1, green: 0.867, blue: 0.727)
    @Published var chosenColor: Color = Color(red: 0.3, green: 0.1, blue: 0.1)
    @Published var transparent: Color = Color(hue: 0, saturation: 0, brightness: 0, opacity: 0)
    @Published var shadowColor: Color = Color(red: 1, green: 0.5, blue: 0.3)
}


