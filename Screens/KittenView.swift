import SwiftUI

struct KittenView: View {
    
    @Binding var kitten: Kitten
    @EnvironmentObject var cat: Cat
    @EnvironmentObject var point: Point
    @EnvironmentObject var customColor: CustomColor
    @EnvironmentObject var kana: Kana
    
    var body: some View {
        VStack {
            // Cat Image
            Image(kitten.catName)
                .resizable()
                .frame(width: 220, height: 220)
                .clipShape(Circle())
                .overlay(Circle().stroke(customColor.frameColor, lineWidth: 4))
                .shadow(radius: 5)
            
            // Cat Name
            HStack {
                Text(kitten.catName)
                    .font(.custom("GloriaHallelujah", size: 28))
                    .foregroundColor(customColor.firstTextColor)
                if (kitten.foodNeeded > 0) {
                    Text("\(Int(kitten.foodNeeded)) left to be full")
                        .font(.custom("GloriaHallelujah", size: 16))
                }
                
            }
            
            // Description Box
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(customColor.frameColor, lineWidth: 4)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(customColor.fillColor)
                    )
                    .frame(width: 300, height: 200)
                    .overlay(
                        Group {
                            if cat.catChosen == kitten.catName {
                                VStack(spacing: 10) {
                                    HStack {
                                        ForEach(Array(kana.romajiArray[cat.getKanaRange()]), id: \.self) { kanaChar in
                                            Text(kanaChar)
                                                .font(.custom("GloriaHallelujah", size: 20))
                                        }
                                    }
                                    HStack {
                                        ForEach(Array(kana.hiraganaArray[cat.getKanaRange()]), id: \.self) { kanaChar in
                                            Text(kanaChar)
                                                .font(.custom("GloriaHallelujah", size: 20))
                                        }
                                    }
                                    HStack {
                                        ForEach(Array(kana.katakanaArray[cat.getKanaRange()]), id: \.self) { kanaChar in
                                            Text(kanaChar)
                                                .font(.custom("GloriaHallelujah", size: 20))
                                        }
                                    }
                                }
                                .padding()
                                .foregroundColor(customColor.firstTextColor)
                                .transition(.opacity.combined(with: .move(edge: .bottom)))
                            }
                        }
                    )
                    .animation(.easeInOut(duration: 0.3), value: cat.catChosen)
            }
            .padding(.bottom, 4)

            
            // Feed Button
            FeedCatButton(kitten: $kitten)
            
        }
        .opacity(kitten.unlocked ? 1.0 : 0.5) // Dim if locked
        .onTapGesture {
            if kitten.unlocked {
                cat.catChosen = kitten.catName
            }
        }
    }
}
