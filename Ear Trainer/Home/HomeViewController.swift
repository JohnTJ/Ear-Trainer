//
//  HomeViewController.swift
//  Ear Trainer
//
//  Created by John Jones on 8/3/19.
//  Copyright © 2019 John Jones. All rights reserved.
//

import UIKit

protocol HomeViewControllerDelegate: class {
    func signOut()
    
    func presentScores()
}

class HomeViewController: UIViewController, Storyboarded {
    
    private weak var delegate: HomeViewControllerDelegate!

    @IBOutlet weak var tableView: UITableView!
    
    var quizStore: QuizStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        establishUI()
    }
    
    func configure(quizStore: QuizStore, delegate: HomeViewControllerDelegate) {
        self.delegate = delegate
        self.quizStore = quizStore
    }
    
    private func establishUI() {
        tableView.delegate = self
        tableView.dataSource = self
        self.title = "Quizes"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: NSLocalizedString("Sign Out", comment: "Sign Out Bar Button"), style: .plain, target: self, action: #selector(signOut))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: NSLocalizedString("My Scores", comment: "My Scores Bar Button"), style: .plain, target: self, action: #selector(signOut))
    }
    
    @objc
    func myScoresTapped() {
        delegate.presentScores()
    }
    
    @objc
    private func signOut() {
        delegate.signOut()
    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return quizStore.quizes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell") as? HomeTableViewCell else {
            fatalError("Could not find cell with identifier 'Cell'")
        }
        
        cell.configure(title: quizStore.quizes[indexPath.section].title, description: quizStore.quizes[indexPath.section].description)
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (cell.responds(to: #selector(getter: UIView.tintColor))){
            if tableView == self.tableView {
                let cornerRadius: CGFloat = 25.0
                cell.backgroundColor = .clear
                let layer: CAShapeLayer = CAShapeLayer()
                let path: CGMutablePath = CGMutablePath()
                let bounds: CGRect = cell.bounds
                bounds.insetBy(dx: 50.0, dy: 0.0)
                var addLine: Bool = false
                
                if indexPath.row == 0 && indexPath.row == ( tableView.numberOfRows(inSection: indexPath.section) - 1) {
                    path.addRoundedRect(in: bounds, cornerWidth: cornerRadius, cornerHeight: cornerRadius)
                    
                } else if indexPath.row == 0 {
                    path.move(to: CGPoint(x: bounds.minX, y: bounds.maxY))
                    path.addArc(tangent1End: CGPoint(x: bounds.minX, y: bounds.minY), tangent2End: CGPoint(x: bounds.midX, y: bounds.minY), radius: cornerRadius)
                    path.addArc(tangent1End: CGPoint(x: bounds.maxX, y: bounds.minY), tangent2End: CGPoint(x: bounds.maxX, y: bounds.midY), radius: cornerRadius)
                    path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
                    
                } else if indexPath.row == (tableView.numberOfRows(inSection: indexPath.section) - 1) {
                    path.move(to: CGPoint(x: bounds.minX, y: bounds.minY))
                    path.addArc(tangent1End: CGPoint(x: bounds.minX, y: bounds.maxY), tangent2End: CGPoint(x: bounds.midX, y: bounds.maxY), radius: cornerRadius)
                    path.addArc(tangent1End: CGPoint(x: bounds.maxX, y: bounds.maxY), tangent2End: CGPoint(x: bounds.maxX, y: bounds.midY), radius: cornerRadius)
                    path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.minY))
                    
                } else {
                    path.addRect(bounds)
                    addLine = true
                }
                
                layer.path = path
                layer.fillColor = UIColor.red.withAlphaComponent(0.28).cgColor //UIColor.white.withAlphaComponent(0.8).cgColor
                
                if addLine {
                    let lineLayer: CALayer = CALayer()
                    let lineHeight: CGFloat = 1.0 / UIScreen.main.scale
                    lineLayer.frame = CGRect(x: bounds.minX + 10.0, y: bounds.size.height - lineHeight, width: bounds.size.width, height: lineHeight)
                    lineLayer.backgroundColor = tableView.separatorColor?.cgColor
                    layer.addSublayer(lineLayer)
                }
                
                let testView: UIView = UIView(frame: bounds)
                testView.layer.insertSublayer(layer, at: 0)
                testView.backgroundColor = .clear
                cell.backgroundView = testView
            }
        }
    }
}
