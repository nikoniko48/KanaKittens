import Foundation

struct ItemModel: Identifiable, Codable {
    var id = UUID() // Ensures uniqueness for SwiftUI lists
    var name: String
    var type: String
    var bought: Bool
    var price: Double
}
