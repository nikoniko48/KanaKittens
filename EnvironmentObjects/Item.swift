//
//  Item.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 30/07/2023.
//

import Foundation

class Item: ObservableObject {
    @Published var chosenItems: [ItemModel] = [
        ItemModel(name: "hat_none", type: "hat", bought: true, price: 0),
        ItemModel(name: "bed_none", type: "bed", bought: true, price: 0),
        ItemModel(name: "toy_none", type: "toy", bought: true, price: 0),
        ItemModel(name: "bowl_none", type: "bowl", bought: true, price: 0)
    ]
    
    @Published var pickedItems: [ItemModel] = [
        ItemModel(name: "hat_none", type: "hat", bought: true, price: 0),
        ItemModel(name: "bed_none", type: "bed", bought: true, price: 0),
        ItemModel(name: "toy_none", type: "toy", bought: true, price: 0),
        ItemModel(name: "bowl_none", type: "bowl", bought: true, price: 0)
    ]
    
    @Published var hatsArray: [ItemModel] = [
        ItemModel(name: "hat_none", type: "hat", bought: true, price: 0),
        ItemModel(name: "basic_hat", type: "hat", bought: false, price: 10),
        ItemModel(name: "whey_hat", type: "hat", bought: false, price: 100000),
        ItemModel(name: "fedora", type: "hat", bought: false, price: 50),
        ItemModel(name: "sombrero", type: "hat", bought: false, price: 70),
        ItemModel(name: "baseball_cap", type: "hat", bought: false, price: 30),
        ItemModel(name: "kawaii_cap", type: "hat", bought: false, price: 90),
        ItemModel(name: "crown", type: "hat", bought: false, price: 500)
    ]
    
    @Published var bedsArray: [ItemModel] = [
        ItemModel(name: "bed_none", type: "bed", bought: true, price: 0),
        ItemModel(name: "basic_bed", type: "bed", bought: false, price: 50),
        ItemModel(name: "whey_bed", type: "bed", bought: false, price: 200),
        ItemModel(name: "elegant_bed", type: "bed", bought: false, price: 300),
        ItemModel(name: "burito_bed", type: "bed", bought: false, price: 120),
        ItemModel(name: "sport_bed", type: "bed", bought: false, price: 150),
        ItemModel(name: "kawaii_bed", type: "bed", bought: false, price: 250),
        ItemModel(name: "kings_bed", type: "bed", bought: false, price: 800)
    ]
    
    @Published var toysArray: [ItemModel] = [
        ItemModel(name: "toy_none", type: "toy", bought: true, price: 0),
        ItemModel(name: "basic_toy", type: "toy", bought: false, price: 10),
        ItemModel(name: "wheyfork", type: "toy", bought: false, price: 50),
        ItemModel(name: "suit_stand", type: "toy", bought: false, price: 80),
        ItemModel(name: "fethers", type: "toy", bought: false, price: 40),
        ItemModel(name: "tennis_ball", type: "toy", bought: false, price: 25),
        ItemModel(name: "pink_wool", type: "toy", bought: false, price: 35),
        ItemModel(name: "huge_diamond", type: "toy", bought: false, price: 1000)
    ]
    
    @Published var bowlsArray: [ItemModel] = [
        ItemModel(name: "bowl_none", type: "bowl", bought: true, price: 0),
        ItemModel(name: "basic_bowl", type: "bowl", bought: false, price: 20),
        ItemModel(name: "farmers_bowl", type: "bowl", bought: false, price: 40),
        ItemModel(name: "elegant_bowl", type: "bowl", bought: false, price: 80),
        ItemModel(name: "mexican_bowl", type: "bowl", bought: false, price: 60),
        ItemModel(name: "sports_bowl", type: "bowl", bought: false, price: 55),
        ItemModel(name: "kawaii_bowl", type: "bowl", bought: false, price: 90),
        ItemModel(name: "kings_bowl", type: "bowl", bought: false, price: 250)
    ]
}
