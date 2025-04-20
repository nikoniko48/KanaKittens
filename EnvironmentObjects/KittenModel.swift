
import Foundation

struct Kitten: Identifiable, Codable {
    var id = UUID() // Unique identifier for SwiftUI lists
    var catName: String
    var foodNeeded: Double
    var foodFed: Double
    var unlocked: Bool
    var fullBelly: Bool
}
