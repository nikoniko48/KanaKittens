//
//  shopTypeButton.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 30/07/2023.
//

import SwiftUI

struct ShopTypeButton: View {
    
    @EnvironmentObject var customColor: CustomColor
    
    @State var name: String
    
    var screenWitdth: CGFloat = UIScreen.main.bounds.width
    var screenHeight: CGFloat = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(customColor.fillColor)
                .frame(width: screenWitdth * 0.45, height: screenHeight * 0.08)
                .frame(width: screenWitdth * 0.48, height: screenHeight * 0.09)
                .background(customColor.frameColor)
                .cornerRadius(16)
            Text(name)
                .font(Font.custom("GloriaHallelujah", size: 23))
                .foregroundColor(customColor.firstTextColor)
        }
    }
}

//struct shopTypeButton_Previews: PreviewProvider {
//    static var previews: some View {
//        shopTypeButton()
//    }
//}
