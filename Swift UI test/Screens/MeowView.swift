//
//  MeowView.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 12/07/2023.
//

import SwiftUI

struct MeowView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var isAnimated: Bool = false
    @State var indexClicked: Int = 0
    @State var changeAnimated: Bool = false
    
    let hiraganaArray: [String] = ["あ", "い", "う", "え", "お", "か", "き", "く", "け", "こ", "さ", "し", "す", "せ", "そ", "た", "ち", "つ", "て", "と", "な", "に", "ぬ", "ね", "の", "は", "ひ", "ふ", "へ", "ほ", "ま", "み", "む", "め", "も", "ら",  "り", "る", "れ", "ろ", "や", "", "ゆ", "", "よ", "わ", "", "ん", "", "を", "が", "ぎ", "ぐ", "げ", "ご", "ざ" , "じ", "ず", "ぜ", "ぞ", "だ", "ぢ", "づ", "で", "ど", "ば", "び", "ぶ", "べ", "ぼ", "ぱ", "ぴ", "ぷ", "ぺ", "ぽ"]
    
    let romajiArray: [String] = ["a", "i", "u", "e", "o", "ka", "ki", "ku", "ke", "ko", "sa", "shi", "su", "se", "so", "ta", "chi", "tsu", "te", "to", "na", "ni", "nu", "ne", "no", "ha", "hi", "fu", "he", "ho", "ma", "mi", "mu", "me", "mo", "ra", "ri", "ru", "re", "ro", "ya", "", "yu", "", "yo", "wa", "", "n", "", "wo", "ga", "gi", "gu", "ge", "go", "za", "ji", "zu", "ze", "zo", "da", "ji", "zu", "de", "do", "ba", "bi", "bu", "be", "bo", "pa", "pi", "pu", "pe", "po"]
    
    
    let rows: [GridItem] = [
        GridItem(.fixed(50), spacing: 20, alignment: nil),
        GridItem(.fixed(50), spacing: 20, alignment: nil),
        GridItem(.fixed(50), spacing: 20, alignment: nil),
        GridItem(.fixed(50), spacing: 20, alignment: nil),
        GridItem(.fixed(50), spacing: 20, alignment: nil),
    ]
    
    //var kanaButtonsArray: [KanaButton] = []
    
    var kanaButtonsArray: [KanaButton] {
            var buttons: [KanaButton] = []
            for index in 0..<75 {
                
                buttons.append(KanaButton(isAnimated: $isAnimated, indexClicked: $indexClicked, index: index))
                
            }
            return buttons
        }
    
    var body: some View {
        ZStack (alignment: .center){
            Color(red: 1, green: 0.867, blue: 0.727)
                .edgesIgnoringSafeArea(.all)
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .padding(20)
            }
            .padding(.top, -390)
            .padding(.leading, -195)
            
            if isAnimated {
                HelpRectangle(changeAnimated: $changeAnimated, index: indexClicked)
                    .animation(.spring(response: 0.6, dampingFraction: 0.6))
            }
            
            ScrollView {
                LazyVGrid(columns: rows) {
                    ForEach(kanaButtonsArray.indices) { i in
                        if i != 41 && i != 43 && i != 46 && i != 48 {
                            kanaButtonsArray[i]
                        } else {
                            Image("tmpCat")
                                .resizable()
                                .scaledToFill()
                        }
                    }
                }
            }
            .padding(.top, 100)
            
            
            Text("Meow by yourself")
                .font(Font.custom("Futura", fixedSize: 30))
                .padding(.top, -370)
                .padding(.leading, 90)
            
        }
    }
}

struct MeowView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(showMeowSheet: false)
        MeowView()
    }
}


