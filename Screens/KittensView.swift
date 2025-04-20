import SwiftUI

struct KittensView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var cat: Cat
    @EnvironmentObject var point: Point
    @EnvironmentObject var customColor: CustomColor
    
    var screenWidth: CGFloat = UIScreen.main.bounds.width
    var screenHeight: CGFloat = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            customColor.backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(customColor.firstTextColor)
                            .font(.largeTitle)
                    }
                    .padding(20)
                    
                    Spacer()
                    
                    HStack(spacing: 6) {
                        Image("Food")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("\(Int(point.numOfRiceballs))")
                            .font(.custom("GloriaHallelujah", size: 18))
                            .bold()
                    }
                    .padding(8)
                    .background(RoundedRectangle(cornerRadius: 10).fill(customColor.fillColor))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(customColor.frameColor, lineWidth: 2)
                    )
                    .foregroundColor(customColor.firstTextColor)
                    .padding(.trailing, 20)
                }
                .offset(y: screenHeight < 700 ? 100 : 50)
                
                //MARK: Horizontal ScrollView
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(cat.kittens.indices, id: \.self) { index in
                            GeometryReader { geo in
                                KittenView(kitten: $cat.kittens[index]) // ✅ Use Kitten model
                                    .rotation3DEffect(Angle(degrees: getPercentage(geo: geo, type: "rotation3D") * -20), axis: (x: 0, y: 1, z: 0))
                                    .scaleEffect(1 * getPercentage(geo: geo, type: "scale"))
                            }
                            .frame(width: 300, height: 400)
                        }
                    }
                    .offset(y: -130)
                    .padding(.leading, 50)
                    .padding(.trailing, 50)
                    .frame(height: 700)
                }
                .frame(width: 400)
                .padding(.top, 100)
                
                Spacer()
            }
        }
        .onDisappear {
            cat.currentRange = cat.getKanaRange()
        }
    }
    
    //MARK: *FUNC* returns percentage of change for GeometryReader
    func getPercentage(geo: GeometryProxy, type: String) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        let currentXScale = abs(geo.frame(in: .global).midX - UIScreen.main.bounds.midX) / 8
        
        switch type {
        case "rotation3D":
            return Double(1 - (currentX / maxDistance))
        case "scale":
            return Double(1 - (currentXScale / maxDistance))
        case "clickable":
            return abs(maxDistance - currentX)
        default:
            return Double(currentX)
        }
    }
}



