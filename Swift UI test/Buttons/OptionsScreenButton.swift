//
//  OptionsScreenButton.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 12/07/2023.
//

import SwiftUI

struct OptionsScreenButton: View {
    
    @Binding var showOptionsView: Bool
    
    var body: some View {
        VStack {
            Button {
                showOptionsView.toggle()
            } label: {
                MainScreenButtonStyle(text: "Options")
            }
        }
    }
}

