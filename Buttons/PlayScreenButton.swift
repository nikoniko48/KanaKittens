//
//  PlayScreenButton.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 12/07/2023.
//

import SwiftUI

struct PlayScreenButton: View {
    
    @Binding var showPlayView: Bool
    
    var body: some View {
        VStack {
            Button {
                showPlayView.toggle()
            } label: {
                
            } 
        }
    }
}
