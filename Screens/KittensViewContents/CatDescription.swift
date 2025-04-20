//
//  CatDescription.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 28/11/2023.
//

import SwiftUI

struct CatDescription: View {
    
    @EnvironmentObject var cat: Cat
    @EnvironmentObject var customColor: CustomColor
    
    @State var catName: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 28.5)
                .fill(customColor.fillColor)
                .frame(maxWidth: cat.catChosen == catName ? 290 : 0)
                .frame(height: 220)
                .padding(.leading, 5)
                .frame(width: 300, height: 230, alignment: .leading)
                .background(cat.catChosen == catName ? customColor.chosenColor : customColor.frameColor)
                .cornerRadius(28.5)
            
            Text("description")
        }
    }
}

//#Preview {
//    CatDescription("Kiko")
//}
