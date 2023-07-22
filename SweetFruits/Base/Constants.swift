//
//  Constants.swift
//  SweetFruits
//
//  Created by Gulzat on 19/7/23.
//

import UIKit

enum GameRowStatus {
    case player
    case way
    case simpleRow
}

var gameRowInfo: [GameRowStatus] = [
    .simpleRow, .simpleRow, .simpleRow, .simpleRow,
    .simpleRow, .simpleRow, .simpleRow, .simpleRow,
    .simpleRow, .simpleRow, .simpleRow, .simpleRow,
    .simpleRow, .simpleRow, .simpleRow, .simpleRow,
    .way, .simpleRow, .simpleRow, .simpleRow,
    .player, .way, .simpleRow, .simpleRow,
]

var levelArr: [Bool] = [
    true, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
]

struct Color {
    static let mainGreen = UIColor(red: 0.141, green: 0.306, blue: 0.725, alpha: 1)
    static let mainYellow = UIColor(red: 255/255, green: 221/255, blue: 23/255, alpha: 1)
    static let gradientStart = UIColor(red: 233/255, green: 0/255, blue: 56/255, alpha: 1)
    static let mainWhite = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
}

struct QuestionInfo {
    var question: String
    var answers: [String]
    var coin: Int
    var correctAnswerIndex: Int
}

extension QuestionInfo {
    static var elements: [QuestionInfo] = [
        QuestionInfo(question: "Which Egyptian god is depicted as a falcon?",
                     answers: ["SET", "OSIRIS", "GORE", "PTAN"],
                     coin: 100,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "Which Egyptian god is depicted as a falcon?",
                     answers: ["SET", "OSIRIS", "GORE", "PTAN"],
                     coin: 120,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "Which Egyptian god is depicted as a falcon?",
                     answers: ["SET", "OSIRIS", "GORE", "PTAN"],
                     coin: 140,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "Which Egyptian god is depicted as a falcon?",
                     answers: ["SET", "OSIRIS", "GORE", "PTAN"],
                     coin: 110,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "Which Egyptian god is depicted as a falcon?",
                     answers: ["SET", "OSIRIS", "GORE", "PTAN"],
                     coin: 95,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "Which Egyptian god is depicted as a falcon?",
                     answers: ["SET", "OSIRIS", "GORE", "PTAN"],
                     coin: 75,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "Which Egyptian god is depicted as a falcon?",
                     answers: ["SET", "OSIRIS", "GORE", "PTAN"],
                     coin: 190,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "Which Egyptian god is depicted as a falcon?",
                     answers: ["SET", "OSIRIS", "GORE", "PTAN"],
                     coin: 150,
                     correctAnswerIndex: 2)
    ]
}

