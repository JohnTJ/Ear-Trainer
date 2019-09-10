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
    private var quiz: Quiz!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        establishUI()

        // Do any additional setup after loading the view.
    }
    
    func configure(quiz: Quiz, delegate: QuizViewControllerDelegate) {
        self.quiz = quiz
        self.delegate = delegate
    }
    
    private func establishUI() {
        self.title = quiz.title
    }
}
