//
//  QuizSettingsViewController.swift
//  Ear Trainer
//
//  Created by John Jones on 9/8/19.
//  Copyright © 2019 John Jones. All rights reserved.
//

import UIKit

protocol QuizSettingsViewControllerDelegate {
    func beginQuiz(quiz: Quiz, viewController: QuizSettingsViewController)
}

class QuizSettingsViewController: UIViewController, Storyboarded {
    
    private var delegate: QuizSettingsViewControllerDelegate!
    private var quiz: Quiz?
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var numberOfQuestionsSegmenetedControl: UISegmentedControl!
    
    @IBAction func beginQuizButton(_ sender: Any) {
        guard let quiz = quiz else {
            fatalError("Could not find quiz")
        }
        delegate.beginQuiz(quiz: quiz, viewController: self)
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
    
    private var numberOfQuestions: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        establishUI()
    }
    
    func configure(quiz: Quiz, delegate: QuizSettingsViewControllerDelegate) {
        self.delegate = delegate
        self.quiz = quiz
    }
    
    func establishUI() {
        guard let quiz = quiz else {
            fatalError("Could not find quiz")
        }
        titleLabel.text = quiz.title
        descriptionLabel.text = quiz.description
        
        backgroundView.backgroundColor = UIColor.red.withAlphaComponent(0.25)
        titleLabel.textColor = UIColor.red.withAlphaComponent(0.25)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
