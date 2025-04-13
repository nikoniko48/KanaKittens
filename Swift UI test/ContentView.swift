//
//  ContentView.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 12/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var showMeowSheet: Bool = false
    @State var showPlayView: Bool = false
    @State var showOptionsView: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack {
                Image("TitleTextPNG")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 315, height: 80)
                    .padding(.bottom, 70)
                PlayScreenButton(showPlayView: $showPlayView)
                    .padding(.bottom, -10)
                HStack(spacing: 35) {
                    OptionsScreenButton(showOptionsView: $showOptionsView)
                    MeowScreenButton(showMeowSheet: $showMeowSheet)
                }
            }
            .sheet(isPresented: $showMeowSheet, content: {
                MeowView()
            })
            .fullScreenCover(isPresented: $showOptionsView, content:  {
                OptionsView()
            })
            .fullScreenCover(isPresented: $showPlayView, content: {
                PlayView()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(showMeowSheet: false)
        MeowView()
    }
}



