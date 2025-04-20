//
//  AskView.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 31/07/2023.
//

import SwiftUI

struct AskView: View {
    
    @EnvironmentObject var customColor: CustomColor
    @EnvironmentObject var item: Item
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(customColor.fillColor)
                .frame(width: 250, height: 110)
                .frame(width: 260, height: 120)
                .background(customColor.frameColor)
                .cornerRadius(12)
            VStack {
                Text("Are you sure you want to buy this item?")
                    .font(Font.custom("GloriaHallelujah", size: 20))
                    .foregroundColor(customColor.firstTextColor)
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(customColor.fillColor)
                            .frame(width: 70, height: 55)
                            .frame(width: 80, height: 65)
                            .background(customColor.frameColor)
                            .cornerRadius(12)
                        Text("Yes")
                            .font(Font.custom("GloriaHallelujah", size: 10))
                            .foregroundColor(customColor.firstTextColor)
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(customColor.fillColor)
                            .frame(width: 70, height: 55)
                            .frame(width: 80, height: 65)
                            .background(customColor.frameColor)
                            .cornerRadius(12)
                        Text("No")
                            .font(Font.custom("GloriaHallelujah", size: 10))
                            .foregroundColor(customColor.firstTextColor)
                    }
                }
            }
        }
    }
}

struct AskView_Previews: PreviewProvider {
    static var previews: some View {
        let cusC = CustomColor()
        let item = Item()
        AskView()
            .environmentObject(item)
            .environmentObject(cusC)
    }
}
