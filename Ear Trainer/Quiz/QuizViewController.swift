//
//  QuizViewController.swift
//  Ear Trainer
//
//  Created by John Jones on 9/10/19.
//  Copyright © 2019 John Jones. All rights reserved.
//

import UIKit

protocol QuizViewControllerDelegate {
    
}

class QuizViewController: UIViewController, Storyboarded {
    
    private var delegate: QuizViewControllerDelegate!
    
    @IBOutlet weak var questionTrackerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var answerChoiceButton1: UIButton!
    @IBOutlet weak var answerChoiceButton2: UIButton!
    @IBOutlet weak var answerChoiceButton3: UIButton!
    @IBOutlet weak var answerChoiceButton4: UIButton!
    
    private var numberOfQuestions = 1
    private var currentQuestion = 1
    private var numberCorrect = 0
    private var currentScore = 100
    
    private var currentCorrectAnswer: Sound!
    private var media: [Sound]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        establishUI()

    }
    
    func configure(media: [Sound], numberOfQuestions: Int, delegate: QuizViewControllerDelegate) {
        self.media = media
        self.numberOfQuestions = numberOfQuestions
        self.delegate = delegate
    }
    
    private func establishUI() {        
        updateLabels()
        questionTrackerLabel.textColor = UIColor.red.withAlphaComponent(0.25)
        
        generateNewCorrectAnswer()

        answerChoiceButton1.setTitle(media[0].getTitle(), for: .normal)
        answerChoiceButton2.setTitle(media[1].getTitle(), for: .normal)
        answerChoiceButton3.setTitle(media[2].getTitle(), for: .normal)
        answerChoiceButton4.setTitle(media[3].getTitle(), for: .normal)
        
        
    }
    
    private func generateNewCorrectAnswer() {
        let correctAnswerPlace = Int.random(in: 0 ..< media.count)
        currentCorrectAnswer = media[correctAnswerPlace]
    }
    
    private func updateLabels() {
        self.questionTrackerLabel.text = "Question \(currentQuestion) of \(numberOfQuestions)"
        self.scoreLabel.text = "Score: \(currentScore)%"
    }
    
    @IBAction func playCurrentSound(_ sender: Any) {
        print(currentCorrectAnswer.getTitle())
        currentCorrectAnswer.play()
    }
    
    @IBAction func choiceSelected(_ sender: Any) {
        
        if ((sender as AnyObject).titleLabel.text == currentCorrectAnswer.getTitle()) {
            print("Correct Answer")
            
            numberCorrect += 1
            generateNewCorrectAnswer()
            currentQuestion += 1
            updateLabels()
            
        } else {
            print("Incorrect")
            currentScore = currentScore - (100 / numberOfQuestions)
            
            updateLabels()
            print(currentScore)
        }
    }
}
