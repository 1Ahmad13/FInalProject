//
//  Game.swift
//  Final(V1)
//
//  Created by Ahmad Hasan on 12/12/21.
//

import Foundation

struct Game {
    
    var questionNumber = 0
    var score = 0
    
    let Game = [
        Question(q: "What is stronger the USD or CAD?", a: ["USD", "CAD"], correctAnswer: "USD"),
        Question(q: "Ahmad has 5 Euros, but Mahdi had 5 dollars who is Richer?", a: ["Ahmad", "Mahdi"], correctAnswer: "Ahmad"),
        Question(q: "How much was bitcoin worth in 2013?", a: ["$1,000", "$13.00"], correctAnswer: "$13.00"),
        Question(q: "Who has the strongest currency in the world?", a: ["Kuwait", "United States"], correctAnswer: "Kuwait"),
        Question(q: "If you owned a 1,000 dollars of Bitcoin in 2015 how much would it be worth today?", a: ["$1,000,000", "$130,000"], correctAnswer: "$130,000")
    ]
    
    func getQuestionText() -> String {
        return Game[questionNumber].text
    }
    
    //Need a way of fetching the answer choices.
    func getAnswers() -> [String] {
        return Game[questionNumber].answers
    }
    
     mutating func nextQuestion() {
        
        if questionNumber + 1 < Game.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        if userAnswer == Game[questionNumber].rightAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
}
