//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Dmitriy Babichev on 04.02.2023.
//

import Foundation

struct QuizBrain {
    let quizQuestions = [Question(text: "Venus is the hottest planet in the solar system",
                                  answer: "True"),
                         Question(text: "In the English language there is no word that rhymes with orange",
                                  answer: "False"),
                         Question(text: "M&M stands for Mars and Moordale",
                                  answer: "False")
    ]

    var questionNumber = 0
    var score = 0

    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quizQuestions[questionNumber].answer {
            score += 1
            return true
        } else {
            return false
        }
    }

    func getScore() -> Int {
        return score
    }

    func getQuestionText() -> String {
        return quizQuestions[questionNumber].text
    }

    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quizQuestions.count)
    }

    mutating func getNextQuestion() {
        if questionNumber < quizQuestions.index(before: quizQuestions.endIndex) {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
}
