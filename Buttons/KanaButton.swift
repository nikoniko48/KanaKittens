
import SwiftUI

struct KanaButton: View {

    @Binding var isAnimated: Bool
    @Binding var indexClicked: Int

//    let hiraganaArray: [String] = ["あ", "い", "う", "え", "お", "か", "き", "く", "け", "こ", "さ", "し", "す", "せ", "そ", "た", "ち", "つ", "て", "と", "な", "に", "ぬ", "ね", "の", "は", "ひ", "ふ", "へ", "ほ", "ま", "み", "む", "め", "も", "ら", "り", "る", "れ", "ろ", "や", "", "ゆ", "", "よ", "わ", "", "ん", "", "を", "が", "ぎ", "ぐ", "げ", "ご", "ざ" , "じ", "ず", "ぜ", "ぞ", "だ", "ぢ", "づ", "で", "ど", "ば", "び", "ぶ", "べ", "ぼ", "ぱ", "ぴ", "ぷ", "ぺ", "ぽ"]

    var index: Int
    
    @EnvironmentObject var customColor: CustomColor
    @EnvironmentObject var kana: Kana

    var body: some View {
        Button {
            indexClicked = index
            withAnimation(.spring(response: 0.45, dampingFraction: 0.6)) {
                isAnimated.toggle()
            }
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(customColor.frameColor)
                    .frame(width: 50, height: 50)
                RoundedRectangle(cornerRadius: 8)
                    .fill(customColor.fillColor)
                    .frame(width: 47, height: 47)
                Text(kana.hiraganaArray[index])
                    .font(Font.custom("GloriaHallelujah", size: 24))
                    .foregroundColor(customColor.firstTextColor)
            }
        }
        .zIndex(5)
    }
}


