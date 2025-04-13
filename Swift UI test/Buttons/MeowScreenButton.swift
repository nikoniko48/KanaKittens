//
//  MainScreenButton.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 12/07/2023.
//

import SwiftUI

struct MeowScreenButton: View {
    
    @Binding var showMeowSheet: Bool
    
    var body: some View {
        VStack {
            Button {
                showMeowSheet.toggle()
            } label: {
                MainScreenButtonStyle(text: "Meow")
            }
        }
    }
}
