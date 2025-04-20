//
//  Kana.swift
//  Swift UI test
//
//  Created by Nikodem Raczka on 26/07/2023.
//

import Foundation

class Kana: ObservableObject {
    
    //0 = rõmaji
    //1 = hiragana
    //2 = katakana
    @Published var katakanaChosen: Bool = false
    @Published var hardModeChosen: Bool = false
    @Published var clear: Bool = false
    
    @Published var katakanaUnlocked: Bool = false
    
    let romajiArray: [String] = ["a", "i", "u", "e", "o", "ka", "ki", "ku", "ke", "ko", "sa", "shi", "su", "se", "so", "ta", "chi", "tsu", "te", "to", "na", "ni", "nu", "ne", "no", "ha", "hi", "fu", "he", "ho", "ma", "mi", "mu", "me", "mo", "ra", "ri", "ru", "re", "ro", "ya", "", "yu", "", "yo", "wa", "", "n", "", "wo"]/*, "ga", "gi", "gu", "ge", "go", "za", "ji(shi)", "zu", "ze", "zo", "da", "ji(chi)", "zu", "de", "do", "ba", "bi", "bu", "be", "bo", "pa", "pi", "pu", "pe", "po"]*/
    
    let hiraganaArray: [String] = ["あ", "い", "う", "え", "お", "か", "き", "く", "け", "こ", "さ", "し", "す", "せ", "そ", "た", "ち", "つ", "て", "と", "な", "に", "ぬ", "ね", "の", "は", "ひ", "ふ", "へ", "ほ", "ま", "み", "む", "め", "も", "ら", "り", "る", "れ", "ろ", "や", "", "ゆ", "", "よ", "わ", "", "ん", "", "を"]/*, "が", "ぎ", "ぐ", "げ", "ご", "ざ" , "じ", "ず", "ぜ", "ぞ", "だ", "ぢ", "づ", "で", "ど", "ば", "び", "ぶ", "べ", "ぼ", "ぱ", "ぴ", "ぷ", "ぺ", "ぽ"]*/
    
    let katakanaArray: [String] = ["ア", "イ", "ウ", "エ", "オ", "カ", "キ", "ク", "ケ", "コ", "サ", "シ", "ス", "セ", "ソ", "タ", "チ", "ツ", "テ", "ト", "ナ", "ニ", "ヌ", "ネ", "ノ", "ハ", "ヒ", "フ", "ヘ", "ホ", "マ", "ミ", "ム", "メ", "モ", "ラ", "リ", "ル", "レ", "ロ", "ヤ", "", "ユ", "", "ヨ", "ワ", "", "ン", "", "ヲ"]
    
}
