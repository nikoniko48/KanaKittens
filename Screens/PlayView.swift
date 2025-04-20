import SwiftUI

struct PlayView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    //MARK: randomIndexes initialization
    @State var randomIndexes: [Int] = {
        var uniqueIndexes = Set<Int>()
        while uniqueIndexes.count < 4 {
            uniqueIndexes.insert(Int.random(in: 0..<5))
        }
        return Array(uniqueIndexes)
    }()
    
    @State var correctIndex: Int = Int.random(in: 0..<4)
    
    @State var isCorrect: Bool = false
    @State var isCorrectInt: Int = 999
    
    @EnvironmentObject var point: Point
    @EnvironmentObject var cat: Cat
    @EnvironmentObject var kana: Kana
    @EnvironmentObject var item: Item
    @EnvironmentObject var customColor: CustomColor
    
    @State var walkAnimation: Bool = false
    @State var changeSprite: Bool = false
    @State var bounceSprite: Bool = false
    @State var startingSprite: Bool = true
    @State var showOptionsView: Bool = false
    @State var showShopView: Bool = false
    @State var jumpAnimation: Bool = false
    @State var jumpAnimation1: Bool = false
    @State var flowAnimation: Int = 0
    @State private var isOptionsViewPresented: Bool = false
    @State var textFloat: Bool = false

    
    @AppStorage("currentCoins") var currentCoins: Double?
    @AppStorage("currentRiceballs") var currentRiceballs: Double?
    
    //MARK: correct and incorrect arrays
    let correctArray: [String] = [
        "Correct!",
        "Right!",
        "Yes!",
        "Good!",
        "Purrrfect!"
    ]

    let incorrectArray: [String] = [
        "Try again!",
        "Nope!",
        "Wrong!",
        "Incorrect!",
        "Oops!"
    ]
    
    @State var randomNum: Int = 0
    
    //MARK: kana arrays
    let hiraganaArray: [String] = ["あ", "い", "う", "え", "お", "か", "き", "く", "け", "こ", "さ", "し", "す", "せ", "そ", "た", "ち", "つ", "て", "と", "な", "に", "ぬ", "ね", "の", "は", "ひ", "ふ", "へ", "ほ", "ま", "み", "む", "め", "も", "ら", "り", "る", "れ", "ろ", "や", "", "ゆ", "", "よ", "わ", "", "ん", "", "を"]/*, "が", "ぎ", "ぐ", "げ", "ご", "ざ" , "じ", "ず", "ぜ", "ぞ", "だ", "ぢ", "づ", "で", "ど", "ば", "び", "ぶ", "べ", "ぼ", "ぱ", "ぴ", "ぷ", "ぺ", "ぽ"]*/

    let romajiArray: [String] = ["a", "i", "u", "e", "o", "ka", "ki", "ku", "ke", "ko", "sa", "shi", "su", "se", "so", "ta", "chi", "tsu", "te", "to", "na", "ni", "nu", "ne", "no", "ha", "hi", "fu", "he", "ho", "ma", "mi", "mu", "me", "mo", "ra", "ri", "ru", "re", "ro", "ya", "", "yu", "", "yo", "wa", "", "n", "", "wo"]/*, "ga", "gi", "gu", "ge", "go", "za", "ji(shi)", "zu", "ze", "zo", "da", "ji(chi)", "zu", "de", "do", "ba", "bi", "bu", "be", "bo", "pa", "pi", "pu", "pe", "po"]*/
    
    var screenWidth: CGFloat = UIScreen.main.bounds.width
    var screenHeight: CGFloat = UIScreen.main.bounds.height
    
    var body: some View {
        //MARK: main ZStack
        ZStack {
//            customColor.backgroundColor
//                .edgesIgnoringSafeArea(.all)
            BackgroundView()
            
            
            VStack {
                //MARK: top HStack
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(customColor.firstTextColor)
                            .font(.system(size: screenWidth * 0.15))
                            .padding()
                    }
                    
                    Spacer()
                    
                    //MARK: points ZStack
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(customColor.fillColor)
                        // 150, 70
                        // 155, 75
                            .frame(width: screenWidth * 0.381, height: screenHeight * 0.081)
                            .frame(width: screenWidth * 0.4, height: screenHeight * 0.09)
                            .background(customColor.frameColor)
                            .cornerRadius(10)
                            .shadow(color: customColor.shadowColor, radius: 3)
                        VStack(spacing: -10) {
                            HStack {
                                Text("KittKoins:")
                                    .font(.custom("GloriaHallelujah", size: 14))
                                Image("KittKoin")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                Text(String(format: "%.0f", currentCoins ?? 0))
                            }
                            .font(.custom("GloriaHallelujah", size: screenWidth * 0.04))
                            .offset(y: jumpAnimation ? -8 : 0)
                            .scaleEffect(jumpAnimation ? 1.05 : 1)
//                            .offset(y: 16)
                            .foregroundColor(customColor.firstTextColor)
                            HStack {
                                Text("Food:")
                                    .font(.custom("GloriaHallelujah", size: 14))
                                    .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                Image("Food")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                Text(String(format: "%.0f", currentRiceballs ?? 0))
                                    .font(.custom("GloriaHallelujah", size: 14))
                                    .lineLimit(1)
                                        .minimumScaleFactor(0.5)
                            }
//                            .offset(y:-10)
                            .font(.custom("GloriaHallelujah", size: screenWidth * 0.040))
                            .offset(y: jumpAnimation1 ? -8 : 0)
                            .scaleEffect(jumpAnimation1 ? 1.05 : 1)
                            .foregroundColor(customColor.firstTextColor)
                            
                        }
                    }.padding(.trailing, 15)
                        .offset(y:15)
//                    .animation(.spring(response: 0.3, dampingFraction: 0.33), value: jumpAnimation)
//                    .animation(.spring(response: 0.3, dampingFraction: 0.33), value: jumpAnimation1)
                    .onTapGesture {
                        showShopView.toggle()
                    }
                }
                //MARK: answer display
                
                ZStack {
                    Image("MainScreenButtonPNG")
                        .resizable()
                        .scaledToFill()
                        .frame(width: screenWidth * 0.6, height: screenHeight * 0.35)
                        .shadow(color: customColor.shadowColor, radius: 3)
                    Text(kana.hardModeChosen ? (kana.romajiArray[randomIndexes[correctIndex]]) : (kana.katakanaChosen ? kana.katakanaArray[randomIndexes[correctIndex]] : kana.hiraganaArray[randomIndexes[correctIndex]]))
                        .font(Font.custom("GloriaHallelujah", size: 130))
                        .foregroundColor(customColor.firstTextColor)
                }
                .padding(.all, 1)
            
                
                //MARK: walking cat VStack
                HStack {            //bowl
                    Image(item.chosenItems[3].name)
                        .resizable()
                        .frame(width: 120, height: 120)
                    ZStack {
                        if isCorrectInt != 0 && isCorrectInt != 999 {
                            Text(isCorrect ? correctArray[randomNum] : incorrectArray[randomNum])
                                .font(Font.custom("GloriaHallelujah", size: 25))
                                .foregroundColor(customColor.firstTextColor)
                                .offset(y: textFloat ? -150 : -50) // 👈 animate upward
                                .opacity(textFloat ? 0 : 1)  // 👈 fade out
                                .animation(.easeOut(duration: 1.0), value: textFloat)
                                .fixedSize()
                                .frame(height: 26)
                                .lineLimit(1)
                                .zIndex(1)
                        }
                        
                        //bed
                        
                        //                        changeSprite ? "Cat1P" : (startingSprite ? "Cat2F" : "Cat2P")
                        
                        Image(cat.catChosen)
                            .resizable()
                            .zIndex(1)
                            .frame(width: 140, height: 140)
                            .scaleEffect(x: bounceSprite ? -1 : 1)
                            .rotation3DEffect(.degrees(changeSprite ? -10 : 10), axis: (x: 0, y: 0, z: 1)) // 👈 Z-axis only
                            .animation(.easeInOut(duration: 0.2).repeatForever(autoreverses: true), value: changeSprite)
                            .onTapGesture {
                                showOptionsView.toggle()
                            }
                        
                            .padding(.all, 0)
                            .offset(x: walkAnimation ? (screenWidth - 270) : -screenWidth + 270) //200
                            .animation(Animation.linear(duration: 2.9), value: walkAnimation)
                        Image(item.chosenItems[1].name)
                            .resizable()
                        //                        .frame(width: screenWidth * 0.4, height: screenHeight > 700 ? screenHeight * 0.10 : screenHeight * 0.12)
                            .frame(width: 120, height: 120)
                            .scaledToFill()
                            .offset(y: 25)
                            .zIndex(-1)
                    }
                            //toy
                    Image(item.chosenItems[2].name)
                        .resizable()
                        .frame(width: 120, height: 120)
                        .zIndex(-1)
                }
                
                //MARK: pickbuttons HStack
                HStack {
                    VStack(spacing: 0) {
                        PickButton1(someString: kana.hardModeChosen ? kana.katakanaChosen ? kana.katakanaArray[randomIndexes[0]] : kana.hiraganaArray[randomIndexes[0]] : kana.romajiArray[randomIndexes[0]], randomIndexes: $randomIndexes, correctIndex: $correctIndex, isCorrect: $isCorrect, isCorrectInt: $isCorrectInt, randomNum: $randomNum, jumpAnimation: $jumpAnimation, jumpAnimation1: $jumpAnimation1, flowAnimation: $flowAnimation, textFloat: $textFloat, kitten: cat.getSelectedKitten())
                            .padding(.bottom, -10)
                            .offset(y: flowAnimation == 1 ? 600 : 0)/*.offset(y:38)*/
                        PickButton2(someString: kana.hardModeChosen ? kana.katakanaChosen ? kana.katakanaArray[randomIndexes[1]] : kana.hiraganaArray[randomIndexes[1]] : kana.romajiArray[randomIndexes[1]], randomIndexes: $randomIndexes, correctIndex: $correctIndex, isCorrect: $isCorrect, isCorrectInt: $isCorrectInt, randomNum: $randomNum, jumpAnimation: $jumpAnimation, jumpAnimation1: $jumpAnimation1, flowAnimation: $flowAnimation, textFloat: $textFloat, kitten: cat.getSelectedKitten())
                            .offset(y: flowAnimation == 2 ? 600 : 0)
                    }/*.offset(y:-10)*/
                    VStack(spacing: 0) {
                        PickButton3(someString: kana.hardModeChosen ? kana.katakanaChosen ? kana.katakanaArray[randomIndexes[2]] : kana.hiraganaArray[randomIndexes[2]] : kana.romajiArray[randomIndexes[2]], randomIndexes: $randomIndexes, correctIndex: $correctIndex, isCorrect: $isCorrect, isCorrectInt: $isCorrectInt, randomNum: $randomNum, jumpAnimation: $jumpAnimation, jumpAnimation1: $jumpAnimation1, flowAnimation: $flowAnimation,textFloat: $textFloat, kitten: cat.getSelectedKitten())
                            .padding(.bottom, -10)
                            .offset(y: flowAnimation == 3 ? 600 : 0)/*.offset(y:38)*/
                        PickButton4(someString: kana.hardModeChosen ? kana.katakanaChosen ? kana.katakanaArray[randomIndexes[3]] : kana.hiraganaArray[randomIndexes[3]] : kana.romajiArray[randomIndexes[3]], randomIndexes: $randomIndexes, correctIndex: $correctIndex, isCorrect: $isCorrect, isCorrectInt: $isCorrectInt, randomNum: $randomNum, jumpAnimation: $jumpAnimation, jumpAnimation1: $jumpAnimation1, flowAnimation: $flowAnimation, textFloat: $textFloat, kitten: cat.getSelectedKitten())
                            .offset(y: flowAnimation == 4 ? 600 : 0)
                    }/*.offset(y:-10)*/
                }
                .padding(.all, 0)
            }
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 2.9, repeats: true) {time in
                    startingSprite = false
                    withAnimation {
                        walkAnimation.toggle()
                    }
                    bounceSprite.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.9) {
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) {time in
                        changeSprite.toggle()
                    }
                }
                    
            
                
            }
            .frame(width: screenWidth, height: screenHeight)
        }//MARK: main end
//        .edgesIgnoringSafeArea(.all) doesn't work with dynamic island
        
        .onAppear {
            initializeRandomIndexes()
        }
        .fullScreenCover(isPresented: $showOptionsView) {
            KittensView()
        }
        .fullScreenCover(isPresented: $showShopView) {
            ShopView()
        }
        .onChange(of: showOptionsView) { newValue in
            if !showOptionsView {
                initializeRandomIndexes()
            }
        }
    }
    
    //MARK: randomIndexes initialization function
    func initializeRandomIndexes() {
            var uniqueIndexes = Set<Int>()
            while uniqueIndexes.count < 4 {
                let randomIndex = Int.random(in: cat.getKanaRange())
                //these are empty in kanaarr
                if randomIndex != 41 && randomIndex != 43 && randomIndex != 46 && randomIndex != 48 {
                    uniqueIndexes.insert(randomIndex)
                }
            }
            randomIndexes = Array(uniqueIndexes)
        }
    
}



