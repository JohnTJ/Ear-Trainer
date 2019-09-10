//
//  QuizFlowCoordinator.swift
//  Ear Trainer
//
//  Created by John Jones on 9/10/19.
//  Copyright © 2019 John Jones. All rights reserved.
//

import UIKit

class QuizFlowCoordinator {
    
    var rootViewController: UIViewController {
        return navigationController
    }
    
    private var navigationController: UINavigationController!
    
    private var quiz: Quiz!
    
    init(quiz: Quiz, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.quiz = quiz
    }
    
    func start() {
        let quizViewController = QuizViewController.instantiate(storyboard: "Quiz")
        quizViewController.configure(quiz: quiz, delegate: self)
        navigationController.pushViewController(quizViewController, animated: true)
    }
}

extension QuizFlowCoordinator: QuizViewControllerDelegate {
    
}
