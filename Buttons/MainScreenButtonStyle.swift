//
//  MainScreenButtonStyle.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 12/07/2023.
//

import SwiftUI

struct MainScreenButtonStyle: View {
    
    var text: String
    @EnvironmentObject var customColor: CustomColor
    
    var body: some View {
        Image("MainScreenButtonPNG").resizable()
            .frame(width: 150, height: 150)
            .shadow(radius: 3)
            .overlay(Text(text)
            .foregroundColor(customColor.secondaryTextColor)
            .font(Font.custom("GloriaHallelujah", size: 35)))
            
    }
}
