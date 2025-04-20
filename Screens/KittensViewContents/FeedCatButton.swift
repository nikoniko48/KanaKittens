import SwiftUI

struct FeedCatButton: View {
    @EnvironmentObject var cat: Cat
    @EnvironmentObject var point: Point
    @EnvironmentObject var customColor: CustomColor

    @Binding var kitten: Kitten
    @State var feed: Bool = false
    var foodFedBonus: Double = 5
    
    @AppStorage("currentCoins") var currentCoins: Double = 0.0
    @AppStorage("currentRiceballs") var currentRiceballs: Double = 0.0

    var body: some View {
        Button {
            print("🟢 Feed Button Clicked for \(kitten.catName)")
            print(point.numOfRiceballs)
            print(currentRiceballs)
            feedCat()
            checkUnlock()
            cat.saveKittens()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 28.5)
                    .fill(.green)
                    .frame(maxWidth: feed ? 250 : 0)
                    .frame(height: 40)
                    .frame(width: 200, height: 40, alignment: .leading)
                    .background(customColor.frameColor)
                    .cornerRadius(28.5)
                HStack {
                    Text(kitten.foodNeeded <= 0 ? "Fully Fed!" : "Feed \(kitten.catName) +\(Int(kitten.foodFed))")
                        .foregroundColor(customColor.firstTextColor)
                        .font(.custom("GloriaHallelujah", size: 16))
                    Image("Food")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
            }
            .shadow(radius: 5)
        }
        .offset(y: cat.catChosen == kitten.catName ? 0 : 600)
        .animation(.linear(duration: 0.3), value: cat.catChosen == kitten.catName)
        .animation(.linear(duration: 0.3), value: kitten.foodNeeded)
        .disabled(feed) // Prevents spam clicking while animating
    }

    func feedCat() {
        guard currentRiceballs >= kitten.foodFed, kitten.foodNeeded > 0 else {
            print("⚠️ Not enough riceballs OR kitten already full")
            return
        }

        print("🍙 Feeding \(kitten.catName)...")
        print("Before Feeding: foodNeeded = \(kitten.foodNeeded), riceballs = \(currentRiceballs)")

        withAnimation(.linear(duration: 0.5)) { feed = true }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            if let index = cat.kittens.firstIndex(where: { $0.catName == kitten.catName }) {
                currentRiceballs -= kitten.foodFed
                cat.kittens[index].foodNeeded -= kitten.foodFed

                print("After Feeding: foodNeeded = \(cat.kittens[index].foodNeeded), riceballs = \(currentRiceballs)")

                if cat.kittens[index].foodNeeded <= 0 {
                    cat.kittens[index].foodNeeded = 0
                    cat.kittens[index].fullBelly = true
                    print("✅ \(kitten.catName) is now FULL!")
                }
                cat.saveKittens()
            }
            feed = false
        }
    }

    func checkUnlock() {
        if kitten.fullBelly {
            if let index = cat.kittens.firstIndex(where: { $0.catName == kitten.catName }) {
                if index < cat.kittens.count - 1 {
                    cat.kittens[index + 1].unlocked = true
                    print("🔓 Unlocked next kitten: \(cat.kittens[index + 1].catName)")
                }
            }
            cat.saveKittens()
        }
    }
}
