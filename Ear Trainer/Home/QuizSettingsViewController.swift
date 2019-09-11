//
//  QuizSettingsViewController.swift
//  Ear Trainer
//
//  Created by John Jones on 9/8/19.
//  Copyright © 2019 John Jones. All rights reserved.
//

import UIKit

protocol QuizSettingsViewControllerDelegate {
    func beginQuiz(media: [Sound], numberOfQuestions: Int, viewController: QuizSettingsViewController)
}

class QuizSettingsViewController: UIViewController, Storyboarded {
    
    private var delegate: QuizSettingsViewControllerDelegate!
    private var quiz: Quiz?
    private var media: [Sound]!
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var numberOfQuestionsSegmenetedControl: UISegmentedControl!
    
    @IBOutlet weak var keyTypeLabel: UILabel!
    @IBOutlet weak var keyTypeSegmentedControl: UISegmentedControl!
    
    
    @IBAction func beginQuizButton(_ sender: Any) {
        delegate.beginQuiz(media: media, numberOfQuestions: numberOfQuestions, viewController: self)
    }
    
    @IBAction func numberOfQuestionsChanged(_ sender: Any) {
        switch numberOfQuestionsSegmenetedControl.selectedSegmentIndex
        {
        case 0:
            numberOfQuestions = 10
        case 1:
            numberOfQuestions = 20
        case 2:
            numberOfQuestions = 30
        case 3:
            numberOfQuestions = 40

        default:
            break
        }
    }

    @IBAction func keyTypeChanged(_ sender: Any) {
        guard let quiz = quiz else {
            fatalError("Could not find quiz")
        }
    
        switch keyTypeSegmentedControl.selectedSegmentIndex {
        case 0:
            media = quiz.media[1]
        case 1:
            media = quiz.media[2]
        default:
            break
        }
    }
    
    
    
    private var numberOfQuestions: Int = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        establishUI()
    }
    
    func configure(quiz: Quiz, delegate: QuizSettingsViewControllerDelegate) {
        self.delegate = delegate
        self.quiz = quiz
        self.media = quiz.media[0]
    }
    
    func establishUI() {
        guard let quiz = quiz else {
            fatalError("Could not find quiz")
        }
        if (quiz.title != "Chord Progressions") {
            keyTypeLabel.isHidden = true
            keyTypeSegmentedControl.isHidden = true
        }
        titleLabel.text = quiz.title
        descriptionLabel.text = quiz.description
        
        backgroundView.backgroundColor = UIColor.red.withAlphaComponent(0.25)
        titleLabel.textColor = UIColor.red.withAlphaComponent(0.25)
        
    }

}
