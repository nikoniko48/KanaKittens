//
//  HelpRectangle.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 13/07/2023.
//

import SwiftUI

struct HelpRectangle: View {
    
    @State var isAnimated: Bool = true
    @Binding var changeAnimated: Bool
    
    
    let romajiArray: [String] = ["a", "i", "u", "e", "o", "ka", "ki", "ku", "ke", "ko", "sa", "shi", "su", "se", "so", "ta", "chi", "tsu", "te", "to", "na", "ni", "nu", "ne", "no", "ha", "hi", "fu", "he", "ho", "ma", "mi", "mu", "me", "mo", "ra", "ri", "ru", "re", "ro", "ya", "", "yu", "", "yo", "wa", "", "n", "", "wo", "ga", "gi", "gu", "ge", "go", "za", "ji", "zu", "ze", "zo", "da", "ji", "zu", "de", "do", "ba", "bi", "bu", "be", "bo", "pa", "pi", "pu", "pe", "po"]
    
    var index: Int
    
    var body: some View {
        Button {
            withAnimation(.easeIn(duration: 0.6)) {
//                if isAnimated {
//                    changeAnimated = true
//                } else {
//                    changeAnimated = false
//                }
                changeAnimated.toggle()
                isAnimated = false
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color(red: 1, green: 0.642, blue: 0.374, opacity: 1))
                    .frame(width: 300, height: 300)
                RoundedRectangle(cornerRadius: 29)
                    .fill(Color(red: 1, green: 0.910, blue: 0.809, opacity: 1))
                    .frame(width: 290, height: 290)
                Text(romajiArray[index])
                    .font(Font.custom("Futura", size: 100))
                    .foregroundColor(.black)
            }
            .offset(y: isAnimated ? 0 : -600)
        }
        .zIndex(isAnimated ? 6 : 0)
    }
}

//struct HelpRectangle_Previews: PreviewProvider {
//    static var previews: some View {
//        HelpRectangle()
//    }
//}
