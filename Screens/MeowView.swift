
import SwiftUI

struct MeowView: View {
    
    @EnvironmentObject var customColor: CustomColor
    
    var body: some View {
        
        //MARK: main ZStack
        ZStack {
            customColor.backgroundColor
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                //MARK: top HStack
                HStack {
                    MeowViewTopHStack()
                }
                .padding(.top, 25)
                
                //MARK: lazyGrid
                ZStack {
                    MeowViewMainStack()
                }
            }
        }
    }
}

//MARK: preview
struct MeowView_Previews: PreviewProvider {
    static var previews: some View {
        let custom = CustomColor()
        MeowView()
            .environmentObject(custom)
    }
}



