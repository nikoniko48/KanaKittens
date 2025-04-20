import Foundation
import SwiftUI

class Cat: ObservableObject {
    @Published var catChosen: String = "Ai"
    @Published var currentRange: Range = 0..<5

    @AppStorage("kittenData") private var kittenData: Data?
    @AppStorage("selectedCat") private var selectedCat: String = "Ai"

    @Published var kittens: [Kitten] = [
        Kitten(catName: "Ai", foodNeeded: 20, foodFed: 5, unlocked: true, fullBelly: false),
        Kitten(catName: "Kiko", foodNeeded: 10, foodFed: 5, unlocked: true, fullBelly: false),
        Kitten(catName: "Sushi", foodNeeded: 20, foodFed: 5, unlocked: false, fullBelly: false),
        Kitten(catName: "Tofu", foodNeeded: 30, foodFed: 5, unlocked: false, fullBelly: false),
        Kitten(catName: "Nono", foodNeeded: 40, foodFed: 5, unlocked: false, fullBelly: false),
        Kitten(catName: "Haru", foodNeeded: 50, foodFed: 5, unlocked: false, fullBelly: false),
        Kitten(catName: "Minami", foodNeeded: 60, foodFed: 5, unlocked: false, fullBelly: false),
        Kitten(catName: "Rio", foodNeeded: 70, foodFed: 5, unlocked: false, fullBelly: false),
        Kitten(catName: "Yuki", foodNeeded: 80, foodFed: 5, unlocked: false, fullBelly: false)
    ]
    
    init() {
        loadKittens()
        catChosen = selectedCat
        currentRange = getKanaRange()
    }

    func saveKittens() {
        if let encoded = try? JSONEncoder().encode(kittens) {
            kittenData = encoded
            print("✅ Saved kitten data to AppStorage!")
        } else {
            print("❌ Failed to save kitten data.")
        }
    }

    func loadKittens() {
        if let data = kittenData, let decoded = try? JSONDecoder().decode([Kitten].self, from: data) {
            kittens = decoded
            print("📂 Loaded kitten data from AppStorage!")
        } else {
            print("❌ No saved kitten data found.")
        }
    }
    
    func selectKitten(_ name: String) {
        if let index = kittens.firstIndex(where: { $0.catName == name }), kittens[index].unlocked {
            catChosen = name
            selectedCat = name
            currentRange = getKanaRange()
            saveKittens()
        }
    }
    
    func getSelectedKitten() -> Binding<Kitten> {
        guard let index = kittens.firstIndex(where: { $0.catName == catChosen }) else {
            return .constant(Kitten(catName: "Ai", foodNeeded: 20, foodFed: 5, unlocked: true, fullBelly: false))
        }
        return Binding(get: { self.kittens[index] }, set: { self.kittens[index] = $0 })
    }

    func getKanaRange() -> Range<Int> {
        switch catChosen {
        case "Ai": return 0..<5
        case "Kiko": return 5..<10
        case "Sushi": return 10..<15
        case "Tofu": return 15..<20
        case "Nono": return 20..<25
        case "Haru": return 25..<30
        case "Minami": return 30..<35
        case "Rio": return 35..<40
        case "Yuki": return 40..<50
        default: return 0..<0
        }
    }
}
