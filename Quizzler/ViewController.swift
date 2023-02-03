//
//  ViewController.swift
//  Quizzler
//
//  Created by Dmitriy Babichev on 02.02.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!

    var questionNumber = 0
    let quizQuestions = [Question(text: "Venus is the hottest planet in the solar system",
                                  answer: "True"),
                         Question(text: "In the English language there is no word that rhymes with orange",
                                  answer: "False"),
                         Question(text: "M&M stands for Mars and Moordale",
                                  answer: "False")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard let currentTitle = sender.currentTitle else { return }

        let userAnswer = currentTitle
        let actualAnswer = quizQuestions[questionNumber].answer
        let buttonBackgroundColor: UIColor

        if userAnswer == actualAnswer {
            buttonBackgroundColor = UIColor.systemGreen
        } else {
            buttonBackgroundColor = UIColor.systemPink
        }

        if questionNumber < quizQuestions.index(before: quizQuestions.endIndex) {
            questionNumber += 1
        } else {
            questionNumber = 0
        }

        UIView.animate(withDuration: 0.3, delay: 0, options: .autoreverse) {
            sender.backgroundColor = buttonBackgroundColor
        } completion: { _ in
            sender.backgroundColor = .clear
        }

        updateUI()
    }

    func updateUI() {
        questionLabel.text = quizQuestions[questionNumber].text
        progressBar.progress = Float(questionNumber + 1) / Float(quizQuestions.count)
    }
}

