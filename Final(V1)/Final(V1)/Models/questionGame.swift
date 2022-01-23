//
//  questionGame.swift
//  Final(V1)
//
//  Created by Ahmad Hasan on 12/12/21.
//

import Foundation

struct Question {
    let text: String
    let answers: [String]
    let rightAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answers = a
        rightAnswer = correctAnswer
    }
}
