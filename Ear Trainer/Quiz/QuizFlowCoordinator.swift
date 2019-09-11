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
    
    private var media: [Sound]!
    
    private var navigationController: UINavigationController!
    
    private var numberOfQuestions = 0
    
    init(media: [Sound], numberOfQuestions: Int, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.numberOfQuestions = numberOfQuestions
        self.media = media
    }
    
    func start() {
        let quizViewController = QuizViewController.instantiate(storyboard: "Quiz")
        quizViewController.configure(media: media, numberOfQuestions: numberOfQuestions, delegate: self)
        navigationController.pushViewController(quizViewController, animated: true)
    }
}

extension QuizFlowCoordinator: QuizViewControllerDelegate {
    
}
