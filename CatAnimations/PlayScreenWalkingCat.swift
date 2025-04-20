

import SwiftUI

struct PlayScreenWalkingCat: View {
    
    @State var walkAnimation: Bool = false
    @State var changeSprite: Bool = false
    @State var bounceSprite: Bool = false
    @State var isCorrect: Bool = false
    @State var startingSprite: Bool = true
    
    var body: some View {
        
        //cloud above cats head
        Image("Cloud")
            .resizable()
            .frame(width: 100, height: 100)
        
        //walking cat animation
        Image(changeSprite ? "Cat1P" : (startingSprite ? "Cat2F" : "Cat2P"))
            .resizable()
            .frame(width: startingSprite ? 120 : 200, height: 140)
            .scaleEffect(x: bounceSprite ? 1 : -1)
            .offset(x: walkAnimation ? 200 : 0)
            .animation(Animation.linear(duration: 2.9), value: walkAnimation)
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 2.9, repeats: true) {time in
                    startingSprite = false
                    withAnimation {
                        walkAnimation.toggle()
                    }
                    bounceSprite.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.9) {
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) {time in
                        changeSprite.toggle()
                    }
                }
            }
    }
}


