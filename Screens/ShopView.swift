//
//  ShopView.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 30/07/2023.
//

import SwiftUI

struct ShopView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var customColor: CustomColor
    @EnvironmentObject var point: Point
    @EnvironmentObject var item: Item
    @EnvironmentObject var cat: Cat
    
    @State var typeChosen: Int = 0
    @State var buy: Bool = false
    @State var ask: Bool = false
    
    @AppStorage("boughtItems") private var boughtItemsData: Data?
    @State private var boughtItems: [String] = []

    func saveBoughtItems() {
        if let encoded = try? JSONEncoder().encode(boughtItems) {
            boughtItemsData = encoded
            print("✅ Items saved to AppStorage: \(boughtItems)")
        } else {
            print("❌ Failed to encode and save bought items.")
        }
    }



    
    func addItem(_ newItem: String) {
        if !boughtItems.contains(newItem) {
            boughtItems.append(newItem)
            saveBoughtItems()
            print("🛍️ Added new item: \(newItem)")
        } else {
            print("ℹ️ Item '\(newItem)' is already bought.")
        }
    }




    func saveArray() {
        if let encodedData = try? JSONEncoder().encode(boughtItems) {
            boughtItemsData = encodedData
        }
    }
    
    func loadArray(item: Item) {
        if let data = boughtItemsData, let decoded = try? JSONDecoder().decode([String].self, from: data) {
            boughtItems = decoded
            print("📂 Loaded bought items: \(boughtItems)")

            for idx in item.hatsArray.indices {
                if boughtItems.contains(item.hatsArray[idx].name) {
                    item.hatsArray[idx].bought = true
                }
            }
            for idx in item.bedsArray.indices {
                if boughtItems.contains(item.bedsArray[idx].name) {
                    item.bedsArray[idx].bought = true
                }
            }
            for idx in item.toysArray.indices {  // ✅ Now updates toys
                if boughtItems.contains(item.toysArray[idx].name) {
                    item.toysArray[idx].bought = true
                }
            }
            for idx in item.bowlsArray.indices { // ✅ Now updates bowls
                if boughtItems.contains(item.bowlsArray[idx].name) {
                    item.bowlsArray[idx].bought = true
                }
            }
        }
    }


    





    
    func loadBought() {
        
    }
    
    var screenWitdth: CGFloat = UIScreen.main.bounds.width
    var screenHeight: CGFloat = UIScreen.main.bounds.height
    
    @AppStorage("currentCoins") var currentCoins: Double = 0.0
    @AppStorage("currentRiceballs") var currentRiceballs: Double = 9999.0
    
    var body: some View {
        ZStack {
            customColor.backgroundColor
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    HStack {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.largeTitle)
                                .padding()
                        }
                        Spacer()
                    }
                    .frame(width: 400)
                    
                    //MARK: shop type buttons
                    VStack(spacing: 8) {
                        HStack {
                            ShopTypeButton(name: "Hats")
                                .onTapGesture {
                                    typeChosen = 0
                                    print(item.pickedItems[typeChosen].name)
                                    for hat in item.hatsArray {
                                        print(hat.bought)
                                    }
                                }
                            ShopTypeButton(name: "Beds")
                                .onTapGesture {
                                    typeChosen = 1
                                }
                        }
                        HStack {
                            ShopTypeButton(name: "Toys")
                                .onTapGesture {
                                    typeChosen = 2
                                }
                            ShopTypeButton(name: "Bowls")
                                .onTapGesture {
                                    typeChosen = 3
                                }
                        }
                    }
                    
                    //MARK: whole grid
                    ZStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(customColor.fillColor)
                                .frame(width: 255, height: 155)
                                .frame(width: 265, height: 165)
                                .background(customColor.frameColor)
                                .cornerRadius(12)
                            VStack {
                                Text("Are you sure you want to buy this item?")
                                    .font(Font.custom("Futura", size: 15))
                                    .foregroundColor(customColor.firstTextColor)
                                    .frame(width: 220)
                                    .padding(.bottom, -30)
                                Image(item.pickedItems[typeChosen].name)
                                    .resizable()
                                    .frame(width: 60, height: 70)
                                HStack {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(customColor.fillColor)
                                            .frame(width: 100, height: 55)
                                            .frame(width: 110, height: 65)
                                            .background(customColor.frameColor)
                                            .cornerRadius(12)
                                        Text("Yes")
                                            .font(Font.custom("GloriaHallelujah", size: 10))
                                            .foregroundColor(customColor.firstTextColor)
                                    }
                                    .onTapGesture {
                                        ask = false
                                        if currentCoins >= item.pickedItems[typeChosen].price {
                                            currentCoins -= item.pickedItems[typeChosen].price
                                            addItem(item.pickedItems[typeChosen].name) // Save item persistently

                                            // Ensure the item is marked as bought in memory
                                            item.pickedItems[typeChosen].bought = true
                                            print("✅ Bought item: \(item.pickedItems[typeChosen].name)")

                                            // ✅ Dynamically update the correct item category
                                            switch item.pickedItems[typeChosen].type {
                                                case "hat":
                                                    for idx in item.hatsArray.indices {
                                                        if item.hatsArray[idx].name == item.pickedItems[typeChosen].name {
                                                            item.hatsArray[idx].bought = true
                                                            print("🎩 Updated hat in array: \(item.hatsArray[idx].name), Bought: \(item.hatsArray[idx].bought)")
                                                        }
                                                    }
                                                case "bed":
                                                    for idx in item.bedsArray.indices {
                                                        if item.bedsArray[idx].name == item.pickedItems[typeChosen].name {
                                                            item.bedsArray[idx].bought = true
                                                            print("🛏️ Updated bed in array: \(item.bedsArray[idx].name), Bought: \(item.bedsArray[idx].bought)")
                                                        }
                                                    }
                                                case "toy":
                                                    for idx in item.toysArray.indices {
                                                        if item.toysArray[idx].name == item.pickedItems[typeChosen].name {
                                                            item.toysArray[idx].bought = true
                                                            print("🧸 Updated toy in array: \(item.toysArray[idx].name), Bought: \(item.toysArray[idx].bought)")
                                                        }
                                                    }
                                                case "bowl":
                                                    for idx in item.bowlsArray.indices {
                                                        if item.bowlsArray[idx].name == item.pickedItems[typeChosen].name {
                                                            item.bowlsArray[idx].bought = true
                                                            print("🥣 Updated bowl in array: \(item.bowlsArray[idx].name), Bought: \(item.bowlsArray[idx].bought)")
                                                        }
                                                    }
                                                default:
                                                    print("⚠️ Unknown item type: \(item.pickedItems[typeChosen].type)")
                                            }
                                        } else {
                                            print("❌ Not enough coins to buy: \(item.pickedItems[typeChosen].name)")
                                        }
                                    }




                                    ZStack {
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(customColor.fillColor)
                                            .frame(width: 100, height: 55)
                                            .frame(width: 110, height: 65)
                                            .background(customColor.frameColor)
                                            .cornerRadius(12)
                                        Text("No")
                                            .font(Font.custom("GloriaHallelujah", size: 10))
                                            .foregroundColor(customColor.firstTextColor)
                                    }
                                    .onTapGesture {
                                        loadBought()
                                        ask = false
                                    }
                                }
                                .padding(.top, -50)
                            }
                        }
                            .opacity(ask ? 1 : 0)
                            .zIndex(ask ? 1 : -1)
                            .animation(.linear(duration: 0.1), value: ask)
                        HStack(spacing: 53) {
                            
                            //MARK: hats grid
                            HatsGrid()
                            
                            //MARK: beds grid
                            BedsGrid()
                            
                            //MARK: toys grid
                            ToysGrid()
                            
                            //MARK: bowls grid
                            BowlsGrid()
                            
                        }
                        .offset(x: typeChosen == 0 ? screenWitdth * 0.92 * 1.5 + 68 : typeChosen == 1 ? screenWitdth * 0.92 * 0.57 : typeChosen == 2 ? -screenWitdth * 0.92 * 0.57 : -screenWitdth * 0.92 * 1.5 - 68)
                        .animation(.easeOut(duration: 0.3), value: typeChosen)
                    }
                    .frame(height: screenHeight * 0.27)
                    
                    //MARK: buy button
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(.green) //.green
                            .frame(maxWidth: buy ? 250 : 0)
                            .frame(height: 55)
                            .frame(width: 250, height: 55, alignment: .leading)
                            .background(customColor.frameColor)
                            .cornerRadius(15)
                        Text("Buy")
                            .font(Font.custom("GloriaHallelujah", size: 25))
                            .foregroundColor(customColor.secondaryTextColor)
                    }
                    .onTapGesture {
                        if (currentCoins >= item.pickedItems[typeChosen].price) && !item.pickedItems[typeChosen].bought {
                            withAnimation(.linear(duration: 0.3)) {
                                buy = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                                ask = true
                                buy = false
                            }
                        } else {print(currentCoins)}
                    }
                    .animation(.linear(duration: 0.1), value: ask)
                    
                    //MARK: cat presentation
                    HStack (alignment: .bottom) {
                        Image(item.chosenItems[2].name)
                            .resizable()
                            .frame(width: 180, height: 230)
                            .padding(.bottom, -70)
                            .padding(.leading, -55)
                        ZStack {
                            Image(item.chosenItems[1].name)
                                .resizable()
                                .frame(width: 140, height: 140)
                                .padding(.leading, -40)
                            Image(cat.catChosen)
                                .resizable()
                                .frame(width: 140, height: 220)
                                .padding(.leading, -40)
                        }
                        Image(item.chosenItems[3].name)
                            .resizable()
                            .frame(width: 70, height: 70)
                    }
                    .frame(height: 200)
                }
                Spacer()
            }
        }
        .onAppear {
            print("🏪 Entered ShopView, loading bought items...")
            loadArray(item: item) // ✅ Now correctly passing `item`
        }


    }
}


