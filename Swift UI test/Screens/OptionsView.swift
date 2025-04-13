//
//  OptionsView.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 14/07/2023.
//

import SwiftUI

struct OptionsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color(red: 1, green: 0.867, blue: 0.727)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack{
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.largeTitle)
                    }
                    .padding(20)
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}
