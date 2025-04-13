////
////  KanaButton.swift
////  Swift UI test
////
////  Created by Nikodem Raczka on 13/07/2023.
////
//
import SwiftUI

struct KanaButton: View {

    @Binding var isAnimated: Bool
    @Binding var indexClicked: Int
    @State var changeAnimated: Bool = true

    let hiraganaArray: [String] = ["あ", "い", "う", "え", "お", "か", "き", "く", "け", "こ", "さ", "し", "す", "せ", "そ", "た", "ち", "つ", "て", "と", "な", "に", "ぬ", "ね", "の", "は", "ひ", "ふ", "へ", "ほ", "ま", "み", "む", "め", "も", "ら", "り", "る", "れ", "ろ", "や", "", "ゆ", "", "よ", "わ", "", "ん", "", "を", "が", "ぎ", "ぐ", "げ", "ご", "ざ" , "じ", "ず", "ぜ", "ぞ", "だ", "ぢ", "づ", "で", "ど", "ば", "び", "ぶ", "べ", "ぼ", "ぱ", "ぴ", "ぷ", "ぺ", "ぽ"]

    var index: Int

    var body: some View {
        Button {
            indexClicked = index
            isAnimated.toggle()
            changeAnimated = false
//            if changeAnimated {
//                isAnimated = true
//            } else {
//                isAnimated = false
//            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(red: 1, green: 0.642, blue: 0.374, opacity: 1))
                    .frame(width: 50, height: 50)
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(red: 1, green: 0.910, blue: 0.809, opacity: 1))
                    .frame(width: 47, height: 47)
                Text(hiraganaArray[index])
                    .font(Font.custom("Futura", size: 24))
                    .foregroundColor(.black)
            }
        }
        .zIndex(5)
    }
}

//po kliknieciu przyciusku kana button na meowView ma pojawic sie HelpRectangle

