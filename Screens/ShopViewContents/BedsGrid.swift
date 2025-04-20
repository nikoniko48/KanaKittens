import SwiftUI

struct BedsGrid: View {
    @EnvironmentObject var customColor: CustomColor
    @EnvironmentObject var point: Point
    @EnvironmentObject var item: Item

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(customColor.frameColor)
                .frame(width: UIScreen.main.bounds.width * 0.92, height: UIScreen.main.bounds.height * 0.25)

            ScrollView {
                VStack(spacing: 10) { // Add spacing for alignment
                    HStack(spacing: 10) {
                        ItemButtonView(itemModel: $item.bedsArray[0])
                        ItemButtonView(itemModel: $item.bedsArray[1])
                        ItemButtonView(itemModel: $item.bedsArray[2])
                    }
                    HStack(spacing: 10) {
                        ItemButtonView(itemModel: $item.bedsArray[3])
                        ItemButtonView(itemModel: $item.bedsArray[4])
                        ItemButtonView(itemModel: $item.bedsArray[5])
                    }
                    HStack(spacing: 10) {
                        ItemButtonView(itemModel: $item.bedsArray[6])
                        ItemButtonView(itemModel: $item.bedsArray[7])
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
