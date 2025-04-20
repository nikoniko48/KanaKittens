import SwiftUI

struct BackgroundView: View {
    @State private var offset: CGFloat = 0
    let imageWidth: CGFloat = 2580

    var body: some View {
        GeometryReader { geometry in
            let screenWidth = geometry.size.width

            
            ZStack {
                LinearGradient(colors: [Color(red: 1, green: 0.867, blue: 0.727), .white], startPoint: .leading, endPoint: .trailing)
                    .edgesIgnoringSafeArea(.all)
                
                
                HStack(spacing: 0) {
                    Image("BG2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: imageWidth, height: geometry.size.height)
                        .offset(x: offset)

                    Image("BG2")
                        .resizable()
                        .scaledToFill()
                        .frame(width: imageWidth, height: geometry.size.height)
                        .offset(x: offset)
                }
                
                .onAppear {
                    withAnimation(Animation.linear(duration: 20).repeatForever(autoreverses: false)) {
                        offset = -imageWidth  // Move the image to the left by its width
                    }
                }
            }
        }
    }
}

// MARK: - Preview
struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
