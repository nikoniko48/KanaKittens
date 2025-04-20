//
//  ContentView.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 12/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var showMeowSheet: Bool = false
    @State var showChooseView: Bool = false
    @State var showKittensView: Bool = false
    @State var showShopView: Bool = false
    @State var selection: String = "Rōmaji"
    @State var clicked: Bool = false
    @State var coins: Int = 0
    @State var animateTitle: Bool = false
    @State var whiskerRotate: Bool = false
    @StateObject var point: Point = Point()
    @StateObject var cat: Cat = Cat()
    @StateObject var kana: Kana = Kana()
    @StateObject var customColor: CustomColor = CustomColor()
    @StateObject var item: Item = Item()
    
    @AppStorage("currentCoins") var currentCoins: Double = 0.0
    @AppStorage("currentRiceballs") var currentRiceballs: Double = 0.0
    
    let options: [String] = [
        "Hiragana",
        "Rōmaji",
        "Katakana"
    ]
    
    @AppStorage("boughtItems") var boughtItemsData: Data?
    @State var boughtItems: [String] = []
    
    func loadArray() {
        if let boughtItemsData = boughtItemsData,
           let decodedArray = try? JSONDecoder().decode([String].self, from: boughtItemsData) {
            boughtItems = decodedArray
            
            for index in item.hatsArray.indices {
                if decodedArray.contains(item.hatsArray[index].name) {
                    var updatedHat = item.hatsArray[index] // ✅ Create a mutable copy
                    updatedHat.bought = true // ✅ Modify the copy
                    item.hatsArray[index] = updatedHat // ✅ Reassign back to array
                }
            }
        }
    }

    
    var body: some View {
        ZStack {
            BackgroundView()
            
            //MARK: main VStack
            VStack {
                
                //MARK: top HStack
                HStack {
                    
                    //MARK: points Zstack
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(customColor.fillColor)
                            .frame(width: 140, height: 55)
                            .frame(width: 145, height: 60)
                            .background(customColor.frameColor)
                            .cornerRadius(10)
                            .shadow(radius: 3)
                        VStack(spacing: -4) {
                                HStack(spacing: 4) {
                                    Text("KittKoins:")
                                        .font(.custom("GloriaHallelujah", size: 14))

                                    Image("KittKoin")
                                        .resizable()
                                        .frame(width: 20, height: 20)

                                    Text(String(format: "%.0f", currentCoins))
                                        .font(.custom("GloriaHallelujah", size: 14))
                                }

                                HStack(spacing: 4) {
                                    Text("Food:")
                                        .font(.custom("GloriaHallelujah", size: 14))

                                    Image("Food")
                                        .resizable()
                                        .frame(width: 20, height: 20)

                                    Text(String(format: "%.0f", currentRiceballs))
                                        .font(.custom("GloriaHallelujah", size: 14))
                                }
                            }
                    }
                    .padding()
                    .onTapGesture {
                        showShopView.toggle()
                    }
                    
                    Spacer()
                    
                    //MARK: change alphabets picker VStack
                    VStack {
                        Button {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                clicked.toggle()
                            }
                        } label: {
                            Image("CatHead")
                                .resizable()
                                .frame(width: 80, height: 80)
                        }
                        if clicked {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 12) {
                                    ForEach(options, id: \.self) { option in
                                        Text(option)
                                            .font(.custom("GloriaHallelujah", size: 16))
                                            .fixedSize(horizontal: true, vertical: false)
                                            .padding(.horizontal, 16)
                                            .padding(.vertical, 6)
                                            .background(selection == option ? Color(red: 1, green: 0.6, blue: 0.4).opacity(0.8) : Color.white.opacity(0.2))
                                            .foregroundColor(selection == option ? .white : .black)
                                            .clipShape(Capsule())
                                            .overlay(
                                                Capsule()
                                                    .stroke(Color(red: 1, green: 0.6, blue: 0.4), lineWidth: 1.5)
                                            )
                                            .onTapGesture {
                                                withAnimation {
                                                    selection = option
                                                }
                                            }
                                    }
                                }
                                .padding(6)
                                .background(Color.white.opacity(0.15))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                            }

                        } else {
                            Text("Click me!!")
                                .font(Font.custom("GloriaHallelujah", size: 20))
                        }

                    }
                    .padding()
                    
                }
                .frame(height: 130)
                .frame(maxWidth: .infinity)
                
                //MARK: title image
                ZStack {
                    Image("TitleTextPNG")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 280, height: 65)
                        .shadow(radius: 3)
                        .offset(y: 30)
                        .scaleEffect(animateTitle ? 1 : 1.1)
                        .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true),  value: animateTitle)
                    Image("whiskers")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 400, height: 120)
                            .shadow(radius: 3)
                            .offset(y: 30)
                            .rotationEffect(.degrees(whiskerRotate ? 5 : -5))
                            .animation(.spring(duration: 0.7, bounce: 1).repeatForever(autoreverses: true), value: whiskerRotate)
                }
                
                Spacer()
                Spacer()
                
                //MARK: buttons Group
                Group {
                    Button {
                        showChooseView.toggle()
                    } label: {
                        MainScreenButtonStyle(text: selection == "Rōmaji" ? "Play" : selection == "Hiragana" ? "あそぶ" : "プレイ")
                    }
                    .padding(.bottom, -10)
                    HStack(spacing: 35) {
                        Button {
                            showKittensView.toggle()
                        } label: {
                            MainScreenButtonStyle(text: selection == "Rōmaji" ? "Kittens" : selection == "Hiragana" ? "こねこ" : "コネコ")
                        }

                        Button {
                            showMeowSheet.toggle()
                        } label: {
                            MainScreenButtonStyle(text: selection == "Rōmaji" ? "Meow" : selection == "Hiragana" ? "にゃー" : "ニャー")
                        }
                    }
                }
                
                Spacer()
            }
            .sheet(isPresented: $showMeowSheet, content: {
                MeowView()
            })
            .fullScreenCover(isPresented: $showKittensView, content:  {
                KittensView()
            })
            .fullScreenCover(isPresented: $showChooseView, content: {
                ChooseView()
            })
            .fullScreenCover(isPresented: $showShopView, content: {
                ShopView()
            })
        }
        .frame(maxWidth: .infinity)
        .animation(.easeIn, value: selection)
        .environmentObject(point)
        .environmentObject(cat)
        .environmentObject(kana)
        .environmentObject(customColor)
        .environmentObject(item)
        .onAppear() {
            loadArray()
            animateTitle = true
            whiskerRotate = true
        }

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(showMeowSheet: false)
        let customColor = CustomColor()
        let point = Point()
        let cat = Cat()
        let kana = Kana()
        let item = Item()
        MeowView()
            .environmentObject(point)
            .environmentObject(cat)
            .environmentObject(kana)
            .environmentObject(customColor)
            .environmentObject(item)

    }
}



