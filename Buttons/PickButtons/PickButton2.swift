
//
//  PickButton.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 16/07/2023.
//

import SwiftUI

struct PickButton2: View {
    
    var someString: String
    @Binding var randomIndexes: [Int]
    @Binding var correctIndex: Int
    @Binding var isCorrect: Bool
    // 1 = correct
    // 0 = default
    // -1 = not correct
    @Binding var isCorrectInt: Int
    @Binding var randomNum: Int
    @Binding var jumpAnimation: Bool
    @Binding var jumpAnimation1: Bool
    @Binding var flowAnimation: Int
    @Binding var textFloat: Bool
    
    @State var clear: Bool = false
    
    @EnvironmentObject var point: Point
    @EnvironmentObject var cat: Cat
    @EnvironmentObject var kana: Kana
    @EnvironmentObject var customColor: CustomColor
    @Binding var kitten: Kitten  // ✅ Now uses a model
    
    var screenWidth: CGFloat = UIScreen.main.bounds.width
    var screenHeight: CGFloat = UIScreen.main.bounds.height
    
    @AppStorage("currentCoins") var currentCoins: Double?
    @AppStorage("currentRiceballs") var currentRiceballs: Double?
    
    var body: some View {
        Button {
            //MARK: set correct isCorrect
            isCorrect = correctIndex == 1 ? true : false
            randomNum = randomNumGenerator(from: 0, to: 5)
            
            //MARK: add points
            if isCorrect {
                var addedCoins = currentCoins ?? 0
                var addedRiceballs = currentRiceballs ?? 0
                
                addedCoins += point.coinsGrowth
                addedRiceballs += point.riceBallsGrowth
                
                currentCoins = addedCoins
                currentRiceballs = addedRiceballs
            }
            
            textFloat = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                textFloat = true
            }
            
            //MARK: correctInt states animation
            withAnimation(.linear(duration: 0.3)) {
                isCorrectInt = correctIndex == 0 ? 1 : -1
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
                withAnimation(.linear(duration: 0.3)) {
                    isCorrectInt = 0
                }
            }
            
            //MARK: flow off and to screen animation
            withAnimation(.linear(duration: 0.3)) {
                flowAnimation = 1
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.linear(duration: 0.3)) {
                    flowAnimation = 3
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.linear(duration: 0.3)) {
                    flowAnimation = 2
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.linear(duration: 0.3)) {
                    flowAnimation = 4
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(.linear(duration: 0.3)) {
                    flowAnimation = 0
                }
            }
            
            
            kana.clear = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                kana.clear = false
            }
            
            
            //MARK: jumpAnimation for points
            withAnimation(.spring(response: 0.3, dampingFraction: 0.33)) {
                jumpAnimation = isCorrect ? true : false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.33) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.33)) {
                    jumpAnimation = false
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.33)) {
                    jumpAnimation1 = isCorrect ? true : false
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.33)) {
                    jumpAnimation1 = false
                }
            }
            
            //MARK: previous the same prevention
            let previousCorrectAnswer = randomIndexes[correctIndex]
            var uniqueIndexes = Set<Int>()
                while uniqueIndexes.count < 4 {
                    let randomIndex = Int.random(in: cat.getKanaRange()) //TUTAJ RZEDY
                    if randomIndex != previousCorrectAnswer && randomIndex != 41 && randomIndex != 43 && randomIndex != 46 && randomIndex != 48 {
                        uniqueIndexes.insert(randomIndex)
                    }
                }
            randomIndexes = Array(uniqueIndexes)
            let previousCorrectIndex = correctIndex
            var newCorrectIndex = Int.random(in: 0..<4)
            while newCorrectIndex == previousCorrectIndex {
                newCorrectIndex = Int.random(in: 0..<4)
            }
            correctIndex = newCorrectIndex
            
        } label: {
            //MARK: label
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(customColor.frameColor)
                    .frame(width: screenWidth * 0.45, height: screenHeight * 0.1)
                    .shadow(color: customColor.shadowColor, radius: 1)
                RoundedRectangle(cornerRadius: 9.5)
                    .fill(customColor.fillColor)
                    .frame(width: screenWidth * 0.43, height: screenHeight * 0.088)
                Text(someString)
                    .font(Font.custom("GloriaHallelujah", size: 50))
                    .foregroundColor(kana.clear ? customColor.transparent : customColor.firstTextColor)
            }
        }
        .disabled(isCorrectInt == 0 ? false : true)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                isCorrectInt = 0
            }
        }
    }
    
    //MARK: random nums func
    func randomNumGenerator(from: Int, to: Int) -> Int {
        return Int.random(in: from..<to)
    }
}

