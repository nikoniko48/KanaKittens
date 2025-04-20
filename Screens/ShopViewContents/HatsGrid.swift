import SwiftUI

struct HatsGrid: View {
    var screenWidth: CGFloat = UIScreen.main.bounds.width
    var screenHeight: CGFloat = UIScreen.main.bounds.height
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var customColor: CustomColor
    @EnvironmentObject var point: Point
    @EnvironmentObject var item: Item

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(customColor.frameColor)
                .frame(width: screenWidth * 0.92, height: screenHeight * 0.25)

            ScrollView {
                VStack(spacing: 10) { // Add spacing for better layout
                    HStack(spacing: 10) {
                        ItemButtonView(itemModel: $item.hatsArray[0])
                        ItemButtonView(itemModel: $item.hatsArray[1])
                        ItemButtonView(itemModel: $item.hatsArray[2])
                    }
                    HStack(spacing: 10) {
                        ItemButtonView(itemModel: $item.hatsArray[3])
                        ItemButtonView(itemModel: $item.hatsArray[4])
                        ItemButtonView(itemModel: $item.hatsArray[5])
                    }
                    HStack(spacing: 10) {
                        ItemButtonView(itemModel: $item.hatsArray[6])
                        ItemButtonView(itemModel: $item.hatsArray[7])
                        Spacer()
                    }
                }
            }
            .scrollIndicators(.hidden)
            .frame(width: screenWidth * 0.9, height: screenHeight * 0.22)
            .background(customColor.frameColor)
            .cornerRadius(15)
        }
        .frame(width: screenWidth * 0.9, height: screenHeight * 0.25)
    }
}
