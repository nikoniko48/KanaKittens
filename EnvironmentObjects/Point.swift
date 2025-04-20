//
//  Coins.swift
//  Swift UI test
//
//  Created by Oliwia Piątkiewicz on 20/07/2023.
//

import Foundation

class Point: ObservableObject {
    
    //coin
    //@Published
    @Published var numOfCoins: Double = 0
    @Published var coinsGrowth: Double = 100
    
    //difficulty
    @Published var coinX: Double = 1
    @Published var riceBallX: Double = 1

    //riceballs
    @Published var numOfRiceballs: Double = 0
    @Published var riceBallsGrowth: Double = 4
    
}
