import SwiftUI

struct ItemButtonView: View {
    
    @EnvironmentObject var customColor: CustomColor
    @EnvironmentObject var item: Item
    @Binding var itemModel: ItemModel
    
    @AppStorage("bought") var boughtStored: Bool?

    var screenWidth: CGFloat = UIScreen.main.bounds.width
    var screenHeight: CGFloat = UIScreen.main.bounds.height

    var body: some View {
        Button {
            pickItem()
            if itemModel.bought {
                chooseItem()
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 23)
                    .fill(customColor.fillColor)
                    .frame(width: screenWidth * 0.25, height: screenHeight * 0.12)
                    .frame(width: screenWidth * 0.27, height: screenHeight * 0.13)
                    .background(picked() ? .white : customColor.frameColor)
                    .cornerRadius(25)
                Text(itemModel.name)
                    .font(Font.custom("GloriaHallelujah", size: 15))
                    .foregroundColor(customColor.firstTextColor)
            }
        }
        .opacity(itemModel.bought ? 1.0 : 0.5) // ✅ Dims button if not bought
    }
    
    /// **✅ Updates the chosen item when clicked**
    func chooseItem() {
        switch itemModel.type {
        case "hat":
            item.chosenItems[0] = itemModel // ✅ Assigns selected item to 'chosenItems'
        case "bed":
            item.chosenItems[1] = itemModel
        case "toy":
            item.chosenItems[2] = itemModel
        case "bowl":
            item.chosenItems[3] = itemModel
        default:
            return
        }
        print("🎯 Chosen item: \(itemModel.name) for \(itemModel.type)")
    }

    /// **✅ Updates the picked item when clicked**
    func pickItem() {
        switch itemModel.type {
        case "hat":
            item.pickedItems[0] = itemModel // ✅ Assigns selected item to 'pickedItems'
        case "bed":
            item.pickedItems[1] = itemModel
        case "toy":
            item.pickedItems[2] = itemModel
        case "bowl":
            item.pickedItems[3] = itemModel
        default:
            return
        }
        print("✅ Picked item: \(itemModel.name) for \(itemModel.type)")
    }

    func picked() -> Bool {
        return item.pickedItems.contains { pickedItem in
            pickedItem.name == itemModel.name
        }
    }
}
