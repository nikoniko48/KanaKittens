//
//  HelpRectangle.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 13/07/2023.
//

import SwiftUI

struct HelpRectangle: View {
    
    @State var isAnimated: Bool = true
    var dismiss: () -> Void
    
    let romajiArray: [String] = ["a", "i", "u", "e", "o", "ka", "ki", "ku", "ke", "ko", "sa", "shi", "su", "se", "so", "ta", "chi", "tsu", "te", "to", "na", "ni", "nu", "ne", "no", "ha", "hi", "fu", "he", "ho", "ma", "mi", "mu", "me", "mo", "ra", "ri", "ru", "re", "ro", "ya", "", "yu", "", "yo", "wa", "", "n", "", "wo", "ga", "gi", "gu", "ge", "go", "za", "ji", "zu", "ze", "zo", "da", "ji", "zu", "de", "do", "ba", "bi", "bu", "be", "bo", "pa", "pi", "pu", "pe", "po"]
    
    var index: Int
    @EnvironmentObject var customColor: CustomColor
    
    var body: some View {
        Button(action: {
            dismiss()
        }) {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(customColor.frameColor)
                    .frame(width: 300, height: 300)
                RoundedRectangle(cornerRadius: 29)
                    .fill(customColor.fillColor)
                    .frame(width: 290, height: 290)
                Text(romajiArray[index])
                    .font(Font.custom("GloriaHallelujah", size: 100))
                    .foregroundColor(customColor.firstTextColor)
                    .transition(.offset(y: -600))
            }
            .transition(.offset(y: -600))
        }
        .zIndex(isAnimated ? 6 : 0)
    }
}
