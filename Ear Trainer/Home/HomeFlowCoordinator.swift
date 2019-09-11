//
//  HomeFlowCoordinator.swift
//  Ear Trainer
//
//  Created by John Jones on 8/3/19.
//  Copyright © 2019 John Jones. All rights reserved.
//

import UIKit

class HomeFlowCoordinator {
    
    var rootViewController: UIViewController {
        return navigationController
    }
    
    private var navigationController: UINavigationController!
    
    private var quizStore: QuizStore
    
    private var quizCoordinator: QuizFlowCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.quizStore = QuizStore()
    }
    
    func start() {
        let homeViewController = HomeViewController.instantiate(storyboard: "Home")
        homeViewController.configure(quizStore: quizStore, delegate: self)
        navigationController.pushViewController(homeViewController, animated: true)
    }
}

extension HomeFlowCoordinator: HomeViewControllerDelegate {
    func signOut(viewController: UIViewController) {
    }
    
    func presentScores(viewController: UIViewController) {
    }
    
    func presentQuizSettings(quiz: Quiz, viewController: UIViewController) {
        
        let quizSettingsViewController = QuizSettingsViewController.instantiate(storyboard: "Home")
        quizSettingsViewController.configure(quiz: quiz, delegate: self)
        quizSettingsViewController.modalPresentationStyle = .fullScreen
        navigationController.pushViewController(quizSettingsViewController, animated: true)
    }
}

extension HomeFlowCoordinator: QuizSettingsViewControllerDelegate {
    func beginQuiz(media: [Sound], numberOfQuestions: Int, viewController: QuizSettingsViewController) {
        
        quizCoordinator = QuizFlowCoordinator(media: media, numberOfQuestions: numberOfQuestions, navigationController: navigationController)
        quizCoordinator?.start()
    }
}
