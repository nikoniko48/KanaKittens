//
//  BackgroundView.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 13/07/2023.
//

import SwiftUI

struct BackgroundView: View {
    @State var isAnimated: Bool = false

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 1, green: 0.867, blue: 0.727), .white], startPoint: .leading, endPoint: .trailing)
                .edgesIgnoringSafeArea(.all)
            
            Image("BG2")
                .resizable()
                .scaledToFill()
                .offset(x: isAnimated ? 531 : 30)
                .onAppear {
                    withAnimation(Animation.linear(duration: 8).repeatForever(autoreverses: false)) {
                        isAnimated = true
                    }
                }
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
