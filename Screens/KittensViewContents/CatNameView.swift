//
//  CatNameView.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 28/11/2023.
//

import SwiftUI

struct CatNameView: View {
    
    @EnvironmentObject var customColor: CustomColor
    
    @State var catName: String
    
    var body: some View {
        Text(catName)
            .frame(width: 150, height: 55)
            .foregroundColor(customColor.firstTextColor)
            .font(Font.custom("GloriaHallelujah", size: 25))
            .background(customColor.frameColor)
            .cornerRadius(20)
    }
}

//#Preview {
//    CatNameView()
//}
