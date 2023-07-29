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

struct LevelInfo {
    var isOpen: Bool
    var questions: [QuestionInfo]
}

var levelArr: [LevelInfo] = [
    LevelInfo(isOpen: true, questions: [QuestionInfo.elements[0], QuestionInfo.elements[1]]),
    LevelInfo(isOpen: false, questions: [QuestionInfo.elements[2], QuestionInfo.elements[3]]),
    LevelInfo(isOpen: false, questions: [QuestionInfo.elements[4], QuestionInfo.elements[5]]),
    LevelInfo(isOpen: false, questions: [QuestionInfo.elements[6], QuestionInfo.elements[7]]),
    LevelInfo(isOpen: false, questions: [QuestionInfo.elements[8], QuestionInfo.elements[9]]),
    LevelInfo(isOpen: false, questions: [QuestionInfo.elements[10], QuestionInfo.elements[11]]),
    LevelInfo(isOpen: false, questions: [QuestionInfo.elements[12], QuestionInfo.elements[13]]),
    LevelInfo(isOpen: false, questions: [QuestionInfo.elements[14], QuestionInfo.elements[15]]),
    LevelInfo(isOpen: false, questions: [QuestionInfo.elements[16], QuestionInfo.elements[17]]),
    LevelInfo(isOpen: false, questions: [QuestionInfo.elements[18], QuestionInfo.elements[19]]),
    LevelInfo(isOpen: false, questions: [QuestionInfo.elements[20], QuestionInfo.elements[21]]),
    LevelInfo(isOpen: false, questions: [QuestionInfo.elements[22], QuestionInfo.elements[23]]),
    LevelInfo(isOpen: false, questions: [QuestionInfo.elements[24], QuestionInfo.elements[25]]),
    LevelInfo(isOpen: false, questions: [QuestionInfo.elements[26], QuestionInfo.elements[27]]),
    LevelInfo(isOpen: false, questions: [QuestionInfo.elements[28], QuestionInfo.elements[29]]),
    LevelInfo(isOpen: false, questions: [QuestionInfo.elements[30], QuestionInfo.elements[31]])
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
        QuestionInfo(question: "What river was the \"lifeblood\" of Ancient Egypt?",
                     answers: ["Nile", "Euphrates", "Tigris", "Indus"],
                     coin: 100,
                     correctAnswerIndex: 2),
        QuestionInfo(question: " What was the ancient Egyptian symbol of infinity?",
                     answers: ["Anubis", "Ankh", "Sphinx", "Hepri"],
                     coin: 120,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "Which pharaoh built the Great Pyramid of Giza?",
                     answers: ["Ramses II", "Khufu (Cheops)", "Hatshepsut", "Thutmose III"],
                     coin: 140,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "What was used as the writing system by the ancient Egyptians?",
                     answers: ["Hieroglyphs", "Cyrillic", "Chinese script", "Greek alphabet"],
                     coin: 110,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "Which plant symbolized rebirth and eternal life in Egyptian mythology?",
                     answers: ["Lotus", "Cactus", "Rose", "Carnation"],
                     coin: 95,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "What was the name of the management system that controlled the distribution of water from the Nile for irrigation?",
                     answers: ["Feudalism", "Pharaonism", "Fayum", "Irrigation"],
                     coin: 75,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "Which of these gods was the patron of the dead and the afterlife?",
                     answers: ["Osiris", "Ra", "Amun", "Geb"],
                     coin: 190,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "Which Egyptian pharaoh declared monotheism and worship of Aten?",
                     answers: ["Khufu", "Amenhotep IV (Akhenaten)", "Senusret I", "Ramesses I"],
                     coin: 150,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "What event was celebrated annually in Ancient Egypt and accompanied by numerous religious and cultural festivities?",
                     answers: ["New Year", "Easter", "The Emerald Games", "Festival of the Sun"],
                     coin: 150,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "Which place served as the capital of Ancient Egypt for most of its history?",
                     answers: ["Giza", "Luxor", "Alexandria", "Memphis"],
                     coin: 150,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "What was the Egyptian paper material made from the stems of papyrus?",
                     answers: ["Papyrus", "Parchment", "Papyrus sheet", "Lotus leaves"],
                     coin: 150,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "Which of these pharaohs was a woman and ruled during the New Kingdom?",
                     answers: ["Thutmose III", "Hatshepsut", "Seti I", "Ramesses II"],
                     coin: 150,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "What structure was used to store mummified bodies of pharaohs and nobles?",
                     answers: ["Pyramid", "Mausoleum", "Tower", "Sarcophagus"],
                     coin: 150,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "What was the name of the special scroll with magical texts placed in the coffins of the deceased?",
                     answers: ["Ka", "Book of the Dead (Scroll of the Dead)", "Bright Path", "Pyramids of Knowledge"],
                     coin: 150,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "What was the name of the Egyptian goddess of the earth, fertility, and motherhood?",
                     answers: ["Isis", "Maat", "Bastet", "Sekhmet"],
                     coin: 150,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "Which of these events was significant for the ancient Egyptians and often depicted in their art and religious rituals?",
                     answers: ["Sunrise", "Eclipse", "Nile Flood", "Comets"],
                     coin: 150,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "What was the first step in the hieroglyphic writing system?",
                     answers: ["Reed pen", "Rose", "Anubis", "Chalk"],
                     coin: 150,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "Which Egyptian god was the patron of wisdom, science, and art?",
                     answers: ["Ra", "Thoth", "Anubis", "Horus"],
                     coin: 150,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "What title did the high priest of Ancient Egypt hold?",
                     answers: ["Mufti", "Pope", "Ahe", "Nesu"],
                     coin: 150,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "Which Egyptian god was associated with the dead, mummification, and protecting tombs?",
                     answers: ["Anubis", "Seth", "Horus", "Geb"],
                     coin: 150,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "Which queen was known for her political power and ruled alongside her husband during the 18th dynasty?",
                     answers: ["Hatshepsut", "Nefertiti", "Cleopatra", "Meritaten"],
                     coin: 150,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "Which ancient Egyptian queen was known for her beauty and was the wife of Pharaoh Akhenaten?",
                     answers: ["Nefertiti", "Cleopatra", "Hatshepsut", "Meritaten"],
                     coin: 150,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "What was the name of the ancient Egyptian god of the sun, often depicted with a falcon head?",
                     answers: ["Ra", "Anubis", "Thoth", "Horus"],
                     coin: 150,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "Which famous archaeological discovery in 1922 revealed the tomb of an ancient Egyptian pharaoh?",
                     answers: ["The Valley of the Kings", "The Temple of Luxor", "The Sphinx", "The Step Pyramid of Djoser"],
                     coin: 150,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "Which ancient Egyptian city was the center of the cult of the god Amun-Ra and known as \"Thebes\" in Greek?",
                     answers: ["Giza", "Memphis", "Luxor", "Alexandria"],
                     coin: 150,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "What was the primary purpose of building pyramids in ancient Egypt?",
                     answers: ["Burial tombs for pharaohs", "Astronomical observatories",
                               "Defensive fortifications", "Religious festivals"],
                     coin: 150,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "Which ancient Egyptian goddess was associated with love, beauty, and fertility?",
                     answers: ["Hathor", "Nut", "Maat", "Sekhmet"],
                     coin: 150,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "What is the name for the ancient Egyptian writing material made from processed animal skins?",
                     answers: ["Papyrus", "Clay tablets", "Stone slabs", "Vellum"],
                     coin: 150,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "Who deciphered the hieroglyphic script, unlocking the knowledge of ancient Egypt's history and culture?",
                     answers: ["Jean-François Champollion", "Howard Carter", "Heinrich Schliemann", "Hiram Bingham"],
                     coin: 150,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "What was the purpose of mummification in ancient Egypt?",
                     answers: ["To preserve the body for the afterlife", "To use as a sacrificial offering",
                               "To create a wax statue of the deceased", "To display the deceased at funerals"],
                     coin: 150,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "Which ancient Egyptian god was depicted as a jackal or a man with a jackal head and was associated with mummification?",
                     answers: ["Osiris", "Horus", "Anubis", "Seth"],
                     coin: 150,
                     correctAnswerIndex: 2),
        QuestionInfo(question: "Which Egyptian god was associated with the dead, mummification, and protecting tombs?",
                     answers: ["Anubis", "Seth", "Horus", "Geb"],
                     coin: 150,
                     correctAnswerIndex: 2)
        
    ]
}

