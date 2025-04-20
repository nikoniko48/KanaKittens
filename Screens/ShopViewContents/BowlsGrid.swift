import SwiftUI

struct BowlsGrid: View {
    @EnvironmentObject var customColor: CustomColor
    @EnvironmentObject var point: Point
    @EnvironmentObject var item: Item

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(customColor.frameColor)
                .frame(width: UIScreen.main.bounds.width * 0.92, height: UIScreen.main.bounds.height * 0.25)
            
            ScrollView {
                VStack(spacing: 10) { // Adds spacing for a better layout
                    HStack(spacing: 10) {
                        ItemButtonView(itemModel: $item.bowlsArray[0])
                        ItemButtonView(itemModel: $item.bowlsArray[1])
                        ItemButtonView(itemModel: $item.bowlsArray[2])
                    }
                    HStack(spacing: 10) {
                        ItemButtonView(itemModel: $item.bowlsArray[3])
                        ItemButtonView(itemModel: $item.bowlsArray[4])
                        ItemButtonView(itemModel: $item.bowlsArray[5])
                    }
                    HStack(spacing: 10) {
                        ItemButtonView(itemModel: $item.bowlsArray[6])
                        ItemButtonView(itemModel: $item.bowlsArray[7])
                        Spacer()
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.22)
            .background(customColor.frameColor)
            .cornerRadius(15)
        }
        .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.25)
    }
}
