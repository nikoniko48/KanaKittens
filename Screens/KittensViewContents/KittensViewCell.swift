import SwiftUI

struct KittensViewCell: View {
    @EnvironmentObject var cat: Cat
    @EnvironmentObject var point: Point
    @EnvironmentObject var customColor: CustomColor
    
    @Binding var kitten: Kitten  // ✅ Now uses a model
    
    var body: some View {
        VStack {
            CatImage()
            CatNameView(catName: kitten.catName)
            CatDescription(catName: kitten.catName)

            FeedCatButton(kitten: $kitten) // ✅ Pass the model to the button
        }
        .onTapGesture {
            withAnimation(.linear(duration: 0.3)) {
                if kitten.unlocked {
                    cat.catChosen = kitten.catName
                }
            }
        }
        .colorMultiply(kitten.unlocked ? Color.white : .gray)
    }
}
