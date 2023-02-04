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

    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard let currentTitle = sender.currentTitle else { return }

        let userAnswer = currentTitle
        let userGotItRight = quizBrain.checkAnswer(userAnswer)

        let buttonBackgroundColor: UIColor

        if userGotItRight {
            buttonBackgroundColor = UIColor.systemGreen
        } else {
            buttonBackgroundColor = UIColor.systemPink
        }

        quizBrain.getNextQuestion()

        UIView.animate(withDuration: 0.2, delay: 0, options: .autoreverse) {
            sender.backgroundColor = buttonBackgroundColor
        } completion: { _ in
            sender.backgroundColor = .clear
        }

        updateUI()
    }

    func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
    }
}

