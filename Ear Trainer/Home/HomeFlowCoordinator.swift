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
        print("Singing Out")
    }
    
    func presentScores(viewController: UIViewController) {
        print("Presenting Scores")
    }
    
    func presentQuizSettings(quiz: Quiz, viewController: UIViewController) {
        print("Presenting Quiz Settings")
        
        let quizSettingsViewController = QuizSettingsViewController.instantiate(storyboard: "Home")
        quizSettingsViewController.configure(quiz: quiz, delegate: self)
        quizSettingsViewController.modalPresentationStyle = .fullScreen
        navigationController.pushViewController(quizSettingsViewController, animated: true)
    }
}

extension HomeFlowCoordinator: QuizSettingsViewControllerDelegate {
    func beginQuiz(quiz: Quiz, viewController: QuizSettingsViewController) {
        print("Starting \(quiz.title)")
    }
}
