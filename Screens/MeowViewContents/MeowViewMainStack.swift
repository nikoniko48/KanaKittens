//
//  MeowViewMainStack.swift
//  Swift UI test
//
//  Created by Oliwia Piątkiewicz on 19/07/2023.
//

import SwiftUI

struct MeowViewMainStack: View {
    
    @State var isAnimated: Bool = false
    @State var indexClicked: Int = 0
    @State var changeSprite: Bool = false
    @EnvironmentObject var cat: Cat
    
    let rows: [GridItem] = [
        GridItem(.fixed(50), spacing: 20, alignment: nil),
        GridItem(.fixed(50), spacing: 20, alignment: nil),
        GridItem(.fixed(50), spacing: 20, alignment: nil),
        GridItem(.fixed(50), spacing: 20, alignment: nil),
        GridItem(.fixed(50), spacing: 20, alignment: nil),
    ]
    
    @EnvironmentObject var kana: Kana
    
    //MARK: kanaButtonsArray
    var kanaButtonsArray: [KanaButton] {
        var buttons: [KanaButton] = []
        for index in 0..<kana.hiraganaArray.count {
            buttons.append(KanaButton(isAnimated: $isAnimated, indexClicked: $indexClicked, index: index))
        }
        return buttons
    }
    
    var body: some View {
        
        //MARK: tapped animation
        if isAnimated {
            HelpRectangle(dismiss: {
                withAnimation(.easeInOut) {
                    isAnimated = false
                }
            }, index: indexClicked)
            .transition(.offset(y: -600))
        }
        
        //MARK: LazyGrid ScrollView
        ScrollView {
            LazyVGrid(columns: rows, spacing: 15) {
                ForEach(0..<kana.hiraganaArray.count, id: \.self) { i in
                    if i == 41 || i == 43 {
                        Image(cat.catChosen)
                            .resizable()
                            .scaledToFill()
                            .scaleEffect(changeSprite ? -1 : 1)
                    } else if i == 46 || i == 48 {
                        Image(cat.catChosen)
                            .resizable()
                            .scaledToFill()
                            .scaleEffect(changeSprite ? -1 : 1)
                    } else {
                        kanaButtonsArray[i]
                    }
                }
            }
        }
        .onAppear{
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) {timer in
                changeSprite.toggle()
            }
        }
    }
}

//MARK: preview
struct MeowViewMainStack_Previews: PreviewProvider {
    static var previews: some View {
        MeowViewMainStack()
    }
}
