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
    func signOut() {
        print("Singing Out")
    }
    
    func presentScores() {
        print("Presenting Scores")
    }
}
