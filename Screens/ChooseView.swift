//
//  ChooseScreen.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 24/07/2023.
//

import SwiftUI

struct ChooseView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var showPlayView: Bool = false
    
    @State var animate: Bool = false
    @State var animate1: Bool = false
    @State var animate2: Bool = false
    @State var animate3: Bool = false
    @State var animate4: Bool = false
    
    @State var isVisible: Bool = false
    
    @EnvironmentObject var point: Point
    @EnvironmentObject var kana: Kana
    @EnvironmentObject var customColor: CustomColor
    
    var screenWitdth: CGFloat = UIScreen.main.bounds.width
    var screenHeight: CGFloat = UIScreen.main.bounds.height
    
    var body: some View {
        //MARK: main ZStack
        ZStack {
            customColor.backgroundColor
                .edgesIgnoringSafeArea(.bottom)
            
            VStack {
                //MARK: top HStack
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.largeTitle)
                            .padding()
                    }
                    .padding(.top, 20)
                    Spacer()
                }
                
                //MARK: top square block
                ZStack {
                    RoundedRectangle(cornerRadius: 28.5)
                        .fill(customColor.fillColor)
                        .frame(width: screenWitdth * 0.9, height: screenHeight * 0.3)
                        .frame(width: screenWitdth * 0.92, height: screenHeight * 0.31)
                        .background(customColor.frameColor)
                        .cornerRadius(28.5)
                        .shadow(radius: 3)
                    Text("Choose what you're learning")
                        .font(Font.custom("GloriaHallelujah", size: screenWitdth * 0.08))
                        .foregroundColor(customColor.firstTextColor)
                        .frame(width: screenWitdth * 0.7)
                }
                .padding(.top, -10)
                .opacity(isVisible ? 1 : 0) //0
                .offset(y: animate ? 0 : -800) //-800
                .animation(.easeOut, value: animate)
                
                //MARK: toggle blocks
                HStack(alignment: .center) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 28.5)
                            .fill(customColor.fillColor)
                            .frame(width: screenWitdth * 0.38, height: screenHeight * 0.15)
                            .frame(width: screenWitdth * 0.4, height: screenHeight * 0.16)
                            .background(kana.hardModeChosen ? customColor.frameColor : customColor.chosenColor)
                            .cornerRadius(28.5)
                            .shadow(radius: 3)
                        VStack(spacing: -10) {
                            Text("Easy Mode")
                                .font(Font.custom("GloriaHallelujah", size: 23))
                                .foregroundColor(customColor.firstTextColor)
                            Text("kana → rōmaji")
                                .font(.custom("GloriaHallelujah", size: 15))
                                .padding(.bottom, 10)
                                .foregroundColor(customColor.firstTextColor)
                            VStack(alignment: .center) {
                                Text("Kittkoins and Riceballs 1x")
                                    .font(.custom("GloriaHallelujah", size: 10))
                                    .foregroundColor(customColor.firstTextColor)
                            }
                        }
                    }
                    .offset(y: animate1 ? 0 : 1200)
                    Group {
                        Toggle("", isOn: $kana.hardModeChosen)
                            .toggleStyle(SwitchToggleStyle(tint: Color(red: 1, green: 0.6, blue: 0.4)))
                            .labelsHidden()
                            .onChange(of: kana.hardModeChosen) {x in
                                //coin
                                //add switch func for setting difficulty level
                                if x {
                                    point.coinX *= 2
                                    point.coinsGrowth *= point.coinX
                                    //riceball
                                    point.riceBallX *= 1.5
                                    point.riceBallsGrowth *= point.riceBallX
                                } else {
                                    point.coinsGrowth /= point.coinX
                                    point.coinX /= 2
                                    //riceball
                                    point.riceBallsGrowth /= point.riceBallX
                                    point.riceBallX /= 1.5
                                }
                            }
                        ZStack {
                            RoundedRectangle(cornerRadius: 28.5)
                                .fill(customColor.fillColor)
                                .frame(width: screenWitdth * 0.38, height: screenHeight * 0.15)
                                .frame(width: screenWitdth * 0.4, height: screenHeight * 0.16)
                                .background(kana.hardModeChosen ? customColor.chosenColor : customColor.frameColor)
                                .cornerRadius(28.5)
                                .shadow(radius: 3)
                            
                            VStack(spacing: -10) {
                                Text("Hard Mode")
                                    .font(Font.custom("GloriaHallelujah", size: 23))
                                    .foregroundColor(customColor.firstTextColor)
                                Text("rōmaji → kana")
                                    .font(.custom("GloriaHallelujah", size: 15))
                                    .padding(.bottom, 10)
                                    .foregroundColor(customColor.firstTextColor)
                                VStack(alignment: .center, spacing: -10) {
                                    HStack(spacing: 4) {
                                        Text("KittKoins")
                                            .font(.custom("GloriaHallelujah", size: 14))

                                        Image("KittKoin")
                                            .resizable()
                                            .frame(width: 20, height: 20)

                                        Text("2x")
                                            .font(.custom("GloriaHallelujah", size: 14))
                                    }

                                    HStack(spacing: 4) {
                                        Text("Food")
                                            .font(.custom("GloriaHallelujah", size: 14))

                                        Image("Food")
                                            .resizable()
                                            .frame(width: 20, height: 20)

                                        Text("1.5x")
                                            .font(.custom("GloriaHallelujah", size: 14))
                                    }
                                }
                            }
                        }
                    }
                    .offset(y: animate2 ? 0 : 1200)
                }
                .padding(.top, -20)
                .opacity(isVisible ? 1 : 0)
                .animation(Animation.easeOut, value: animate1)
                .animation(.easeOut, value: animate2)
                .animation(.linear, value: kana.hardModeChosen)
                
                //MARK: hiragana and katakana blocks
                Group {
                    ZStack {
                        RoundedRectangle(cornerRadius: 28.5)
                            .fill(customColor.fillColor)
                            .frame(width: screenWitdth * 0.9, height: screenHeight * 0.15)
                            .frame(width: screenWitdth * 0.92, height: screenHeight * 0.16)
                            .background(customColor.frameColor)
                            .cornerRadius(28.5)
                            .shadow(radius: 3)
                        VStack(spacing: -10) {
                            Text("Hi  Ra  Ga  Na")
                                .font(.custom("GloriaHallelujah", size: 35))
                            Text("ひ  ら  が  な")
                                .font(.custom("GloriaHallelujah", size: 30))
                        }
                        .foregroundColor(customColor.firstTextColor)
                    }
                    .offset(y: animate3 ? 0 : 1400)
                    .padding(.bottom, -8)
//                    .opacity(isVisible ? 1 : 0)
                    .animation(.easeOut, value: animate3)
                    .onTapGesture {
                        kana.katakanaChosen = false
                        showPlayView.toggle()
                    }
                    Button {
                        kana.katakanaChosen = true
                        showPlayView.toggle()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 28.5)
                                .fill(customColor.fillColor)
                                .frame(width: screenWitdth * 0.9, height: screenHeight * 0.15)
                                .frame(width: screenWitdth * 0.92, height: screenHeight * 0.16)
                                .background(customColor.frameColor)
                                .cornerRadius(28.5)
                                .shadow(radius: 3)
                            VStack(spacing: -10) {
                                Text("Ka  Ta  Ka  Na")
                                    .font(.custom("GloriaHallelujah", size: 35))
                                Text("カ  タ  カ  ナ")
                                    .font(.custom("GloriaHallelujah", size: 30))
                            }
                            .foregroundColor(customColor.firstTextColor)
                        }.offset(y:-10)
                    }
                    .offset(y: animate4 ? 0 : 1600)
//                    .opacity(isVisible ? 0.7 : 0)
                    .animation(.easeOut, value: animate4)
//                    .disabled(kana.katakanaUnlocked ? false : true)
//                    .onTapGesture {
//                        kana.katakanaChosen = true
//                        showPlayView.toggle()
//                    }
                }
            }
        }//MARK: main end
        .edgesIgnoringSafeArea(.all)
        .frame(height: screenHeight)
        //timers for animations
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                isVisible.toggle()
                animate.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                animate1.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                animate2.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                animate3.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.55) {
                animate4.toggle()
            }
        }
        .fullScreenCover(isPresented: $showPlayView, content: {
            PlayView()
        })
    }
}

//MARK: preview
struct ChooseScreen_Previews: PreviewProvider {
    @EnvironmentObject var coin: Point
    static var previews: some View {
        let kana = Kana()
        let customC = CustomColor()
        let point = Point()
        ChooseView()
            .environmentObject(kana)
            .environmentObject(customC)
            .environmentObject(point)
    }
}
