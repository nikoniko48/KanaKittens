//
//  CatImage.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 28/11/2023.
//

import SwiftUI

struct CatImage: View {
    var body: some View {
        Image("Cat2F")
            .resizable()
            .frame(width: 100, height: 150)
    }
}

#Preview {
    CatImage()
}
