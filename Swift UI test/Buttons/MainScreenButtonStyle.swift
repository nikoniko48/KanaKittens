//
//  MainScreenButtonStyle.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 12/07/2023.
//

import SwiftUI

struct MainScreenButtonStyle: View {
    
    var text: String
    
    var body: some View {
        Image("MainScreenButtonPNG").resizable()
            .frame(width: 150, height: 150)
            .overlay(Text(text).foregroundColor(.white).font(Font.custom("Futura", size: 35)))
    }
}
